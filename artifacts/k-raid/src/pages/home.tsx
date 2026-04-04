import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";

const INDIAN_STATES = [
  "Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chhattisgarh",
  "Goa","Gujarat","Haryana","Himachal Pradesh","Jharkhand","Karnataka",
  "Kerala","Madhya Pradesh","Maharashtra","Manipur","Meghalaya","Mizoram",
  "Nagaland","Odisha","Punjab","Rajasthan","Sikkim","Tamil Nadu",
  "Telangana","Tripura","Uttar Pradesh","Uttarakhand","West Bengal",
  "Andaman and Nicobar Islands","Chandigarh","Dadra and Nagar Haveli",
  "Daman and Diu","Delhi","Jammu and Kashmir","Ladakh","Lakshadweep","Puducherry",
];

type Question = { id: number; question_text: string; order: number };
type Video = { id: number; title: string; url: string; order: number; questions: Question[] };

export default function Home() {
  const { toast } = useToast();

  const [videos, setVideos] = useState<Video[]>([]);
  const [loading, setLoading] = useState(true);
  const [name, setName] = useState("");
  const [district, setDistrict] = useState("");
  const [state, setState] = useState("");
  const [designation, setDesignation] = useState<"player" | "coach" | "">("");
  const [answers, setAnswers] = useState<Record<number, string>>({});
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  useEffect(() => {
    fetchVideos();
  }, []);

  async function fetchVideos() {
    setLoading(true);
    const { data: vids, error: vidErr } = await supabase
      .from("videos")
      .select("*")
      .order("order", { ascending: true });

    if (vidErr || !vids) {
      setLoading(false);
      return;
    }

    const { data: qs, error: qErr } = await supabase
      .from("questions")
      .select("*")
      .order("order", { ascending: true });

    if (qErr) {
      setLoading(false);
      return;
    }

    const enriched: Video[] = vids.map((v) => ({
      ...v,
      questions: (qs || []).filter((q) => q.video_id === v.id),
    }));

    setVideos(enriched);
    setLoading(false);
  }

  function setAnswer(questionId: number, value: string) {
    setAnswers((prev) => ({ ...prev, [questionId]: value }));
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();

    if (!name.trim() || !district.trim() || !state || !designation) {
      toast({ title: "Missing Information", description: "Please fill in all personal details.", variant: "destructive" });
      return;
    }

    for (const video of videos) {
      for (const q of video.questions) {
        if (!answers[q.id]?.trim()) {
          toast({ title: "Incomplete Answers", description: `Please answer all questions for "${video.title}".`, variant: "destructive" });
          return;
        }
      }
    }

    setSubmitting(true);

    const { data: submission, error: subErr } = await supabase
      .from("submissions")
      .insert([{ name: name.trim(), district: district.trim(), state, designation }])
      .select()
      .single();

    if (subErr || !submission) {
      setSubmitting(false);
      toast({ title: "Submission Failed", description: subErr?.message || "Could not save your details.", variant: "destructive" });
      return;
    }

    const responseRows = [];
    for (const video of videos) {
      for (const q of video.questions) {
        responseRows.push({ submission_id: submission.id, question_id: q.id, answer_text: answers[q.id] || "" });
      }
    }

    const { error: respErr } = await supabase.from("responses").insert(responseRows);

    setSubmitting(false);

    if (respErr) {
      toast({ title: "Partial Failure", description: "Details saved but answers could not be stored.", variant: "destructive" });
      return;
    }

    setSubmitted(true);
    toast({ title: "Submitted Successfully", description: "Your response has been recorded. Thank you!" });
  }

  function resetForm() {
    setSubmitted(false);
    setName(""); setDistrict(""); setState(""); setDesignation("");
    setAnswers({});
  }

  if (submitted) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center px-4">
        <div className="text-center max-w-md">
          <div className="w-24 h-24 rounded-full bg-primary/20 border-2 border-primary/40 flex items-center justify-center mx-auto mb-6">
            <svg className="w-12 h-12 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
            </svg>
          </div>
          <h2 className="text-3xl font-black text-foreground mb-3">Thank You!</h2>
          <p className="text-muted-foreground text-lg mb-1">Your submission has been recorded successfully.</p>
          <p className="text-muted-foreground text-sm">We appreciate your participation in K-RAID.</p>
          <button onClick={resetForm} className="mt-8 px-8 py-3 bg-primary text-primary-foreground font-bold rounded-xl hover:opacity-90 transition-opacity">
            Submit Another Response
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background text-foreground">
      {/* Header */}
      <header className="sticky top-0 z-50 bg-background/90 backdrop-blur-md border-b border-border">
        <div className="max-w-5xl mx-auto px-4 py-4 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-primary flex items-center justify-center font-black text-primary-foreground text-lg">K</div>
            <div>
              <h1 className="text-xl font-black tracking-wider text-foreground">K-RAID</h1>
              <p className="text-xs text-muted-foreground leading-none">Kabaddi Player &amp; Coach Registration</p>
            </div>
          </div>
          <a href="/admin" className="text-xs text-muted-foreground hover:text-primary transition-colors px-3 py-1.5 border border-border rounded-lg hover:border-primary/50">
            Admin
          </a>
        </div>
      </header>

      <form onSubmit={handleSubmit} className="max-w-5xl mx-auto px-4 py-10 space-y-8">
        {/* Hero */}
        <div className="text-center py-6">
          <div className="inline-flex items-center gap-2 px-4 py-1.5 bg-primary/10 border border-primary/30 rounded-full text-primary text-sm font-semibold mb-4">
            <span className="w-2 h-2 rounded-full bg-primary animate-pulse"></span>
            Registration Open
          </div>
          <h2 className="text-4xl md:text-5xl font-black tracking-wide text-foreground mb-3">
            Register Your <span className="text-primary">K-RAID</span> Profile
          </h2>
          <p className="text-muted-foreground text-lg max-w-xl mx-auto">
            Watch all videos, answer the questions thoroughly, and submit your details.
          </p>
        </div>

        {/* Personal Details */}
        <section className="bg-card border border-card-border rounded-2xl p-6 md:p-8 shadow-md">
          <div className="flex items-center gap-3 mb-6">
            <span className="w-8 h-8 rounded-full bg-primary text-primary-foreground text-sm font-bold flex items-center justify-center">1</span>
            <h3 className="text-xl font-bold text-foreground">Personal Details</h3>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
            <div>
              <label className="block text-sm font-semibold text-foreground mb-2">Full Name <span className="text-destructive">*</span></label>
              <input
                type="text" required value={name} onChange={(e) => setName(e.target.value)}
                placeholder="Enter your full name"
                className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring transition"
              />
            </div>
            <div>
              <label className="block text-sm font-semibold text-foreground mb-2">District <span className="text-destructive">*</span></label>
              <input
                type="text" required value={district} onChange={(e) => setDistrict(e.target.value)}
                placeholder="Enter your district"
                className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring transition"
              />
            </div>
            <div>
              <label className="block text-sm font-semibold text-foreground mb-2">State <span className="text-destructive">*</span></label>
              <select
                required value={state} onChange={(e) => setState(e.target.value)}
                className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground focus:outline-none focus:ring-2 focus:ring-ring transition"
              >
                <option value="" disabled>Select your state</option>
                {INDIAN_STATES.map((s) => <option key={s} value={s}>{s}</option>)}
              </select>
            </div>
            <div>
              <label className="block text-sm font-semibold text-foreground mb-2">Designation <span className="text-destructive">*</span></label>
              <div className="flex gap-3">
                {(["player", "coach"] as const).map((d) => (
                  <button
                    key={d} type="button" onClick={() => setDesignation(d)}
                    className={`flex-1 py-3 rounded-lg border font-semibold text-sm capitalize transition-all ${
                      designation === d
                        ? "bg-primary border-primary text-primary-foreground shadow-lg"
                        : "bg-background border-input text-muted-foreground hover:border-ring hover:text-foreground"
                    }`}
                  >{d}</button>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* Videos + Questions */}
        {loading ? (
          <div className="text-center py-16">
            <div className="w-12 h-12 border-4 border-primary border-t-transparent rounded-full animate-spin mx-auto mb-4"></div>
            <p className="text-muted-foreground">Loading videos and questions...</p>
          </div>
        ) : videos.length === 0 ? (
          <div className="text-center py-16 bg-card border border-card-border rounded-2xl">
            <div className="w-16 h-16 rounded-full bg-muted flex items-center justify-center mx-auto mb-4">
              <svg className="w-8 h-8 text-muted-foreground" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M15 10l4.553-2.069A1 1 0 0121 8.82v6.36a1 1 0 01-1.447.894L15 14M3 8a2 2 0 012-2h8a2 2 0 012 2v8a2 2 0 01-2 2H5a2 2 0 01-2-2V8z" />
              </svg>
            </div>
            <p className="text-muted-foreground font-medium">No videos available yet.</p>
            <p className="text-muted-foreground text-sm mt-1">Check back later or contact the administrator.</p>
          </div>
        ) : (
          videos.map((video, idx) => (
            <section key={video.id} className="bg-card border border-card-border rounded-2xl p-6 md:p-8 shadow-md space-y-6">
              <div className="flex items-center gap-3">
                <span className="w-8 h-8 rounded-full bg-primary text-primary-foreground text-sm font-bold flex items-center justify-center">{idx + 2}</span>
                <h3 className="text-xl font-bold text-foreground">{video.title}</h3>
              </div>
              <div className="rounded-xl overflow-hidden border border-border bg-black aspect-video">
                <video controls className="w-full h-full" src={video.url} preload="metadata">
                  Your browser does not support the video tag.
                </video>
              </div>
              <div className="space-y-6">
                {video.questions.map((q, qi) => (
                  <div key={q.id}>
                    <label className="block text-sm font-semibold text-foreground mb-2">
                      <span className="text-primary mr-1">Q{qi + 1}.</span>
                      {q.question_text}
                      <span className="text-destructive ml-1">*</span>
                    </label>
                    <textarea
                      required rows={6}
                      value={answers[q.id] || ""}
                      onChange={(e) => setAnswer(q.id, e.target.value)}
                      placeholder="Write your detailed answer here..."
                      className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring transition resize-y min-h-[140px]"
                    />
                  </div>
                ))}
                {video.questions.length === 0 && (
                  <p className="text-muted-foreground text-sm italic">No questions added for this video yet.</p>
                )}
              </div>
            </section>
          ))
        )}

        {/* Submit */}
        {!loading && videos.length > 0 && (
          <div className="pb-10">
            <button
              type="submit" disabled={submitting}
              className="w-full py-4 bg-primary text-primary-foreground font-bold text-lg rounded-xl hover:opacity-90 disabled:opacity-50 disabled:cursor-not-allowed transition-all shadow-lg flex items-center justify-center gap-3"
            >
              {submitting ? (
                <>
                  <svg className="animate-spin h-5 w-5" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z" />
                  </svg>
                  Submitting...
                </>
              ) : "Submit Registration"}
            </button>
            <p className="text-center text-muted-foreground text-sm mt-4">
              All fields are required. Ensure you have answered all questions before submitting.
            </p>
          </div>
        )}
      </form>
    </div>
  );
}

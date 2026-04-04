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

type QuestionItem = { question_text: string; order: number };
type Video = { id: number; title: string; url: string; order: number; questions: QuestionItem[] };

function IconUser() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/>
    </svg>
  );
}

function IconMapPin() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
      <path d="M20 10c0 6-8 12-8 12S4 16 4 10a8 8 0 1 1 16 0z"/><circle cx="12" cy="10" r="3"/>
    </svg>
  );
}

function IconCheck() {
  return (
    <svg width="28" height="28" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="20 6 9 17 4 12"/>
    </svg>
  );
}

function IconVideo() {
  return (
    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round">
      <rect x="2" y="6" width="14" height="12" rx="2"/><path d="m22 8-6 4 6 4V8z"/>
    </svg>
  );
}

function IconChevronRight() {
  return (
    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
      <path d="m9 18 6-6-6-6"/>
    </svg>
  );
}

function IconLoader() {
  return (
    <svg className="animate-spin" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
      <path d="M21 12a9 9 0 1 1-6.219-8.56"/>
    </svg>
  );
}

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

  useEffect(() => { fetchVideos(); }, []);

  async function fetchVideos() {
    setLoading(true);
    const { data: vids } = await supabase.from("videos").select("*").order("order", { ascending: true });
    setVideos((vids || []).map((v) => ({ ...v, questions: Array.isArray(v.questions) ? v.questions : [] })));
    setLoading(false);
  }

  function answerKey(videoId: number, qIndex: number) {
    return `${videoId}_${qIndex}`;
  }

  function setAnswer(videoId: number, qIndex: number, value: string) {
    setAnswers((prev) => ({ ...prev, [answerKey(videoId, qIndex)]: value }));
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    if (!name.trim() || !district.trim() || !state || !designation) {
      toast({ title: "Missing Information", description: "Please fill in all personal details.", variant: "destructive" });
      return;
    }
    for (const video of videos) {
      for (let qi = 0; qi < video.questions.length; qi++) {
        if (!answers[answerKey(video.id, qi)]?.trim()) {
          toast({ title: "Incomplete Answers", description: `Please answer all questions for "${video.title}".`, variant: "destructive" });
          return;
        }
      }
    }
    setSubmitting(true);
    const { data: submission, error: subErr } = await supabase
      .from("submissions").insert([{ name: name.trim(), district: district.trim(), state, designation }]).select().single();
    if (subErr || !submission) {
      setSubmitting(false);
      toast({ title: "Submission Failed", description: subErr?.message || "Could not save your details.", variant: "destructive" });
      return;
    }
    const responseRows = videos.flatMap((v) =>
      v.questions.map((q, qi) => ({
        submission_id: submission.id,
        video_id: v.id,
        question_index: qi,
        question_text: q.question_text,
        answer_text: answers[answerKey(v.id, qi)] || "",
      }))
    );
    const { error: respErr } = await supabase.from("responses").insert(responseRows);
    setSubmitting(false);
    if (respErr) {
      toast({ title: "Partial Error", description: "Details saved but some answers failed.", variant: "destructive" });
      return;
    }
    setSubmitted(true);
  }

  function resetForm() {
    setSubmitted(false); setName(""); setDistrict(""); setState(""); setDesignation(""); setAnswers({});
  }

  if (submitted) {
    return (
      <div className="min-h-screen bg-background bg-grid flex items-center justify-center px-4">
        <div className="text-center max-w-md">
          <div className="w-24 h-24 rounded-full bg-primary/10 border-2 border-primary/30 flex items-center justify-center mx-auto mb-6 glow-primary-sm text-primary">
            <IconCheck />
          </div>
          <h2 className="text-3xl font-black text-foreground mb-3">Response Recorded</h2>
          <p className="text-muted-foreground text-base mb-1">Your data has been captured successfully.</p>
          <p className="text-muted-foreground text-sm">Thank you for contributing to the K-RAID research study.</p>
          <button onClick={resetForm} className="mt-8 px-8 py-3 bg-primary text-primary-foreground font-bold rounded-xl hover:bg-primary/90 transition-colors glow-primary-sm">
            Submit Another Response
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background text-foreground">
      {/* Ambient glow at top */}
      <div className="fixed top-0 left-1/2 -translate-x-1/2 w-[600px] h-[200px] bg-primary/8 rounded-full blur-3xl pointer-events-none" />

      {/* Header */}
      <header className="site-header relative">
        <div className="max-w-5xl mx-auto px-4 h-16 flex items-center justify-between relative z-10">
          <div className="flex items-center gap-3">
            <div className="header-logo-icon">K</div>
            <div className="flex items-center gap-2.5">
              <span className="header-logo-text">K-RAID</span>
              <span className="text-xs text-muted-foreground hidden sm:inline tracking-wide">Kabaddi Research Study</span>
            </div>
          </div>
          <div className="header-status-pill">
            <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse inline-block"></span>
            Data Collection Active
          </div>
        </div>
      </header>

      <form onSubmit={handleSubmit} className="max-w-5xl mx-auto px-4 py-12 space-y-8 relative">
        {/* Hero */}
        <div className="text-center py-8">
          <p className="text-xs font-semibold tracking-[0.3em] text-primary uppercase mb-4">Final Year Research Project &mdash; Data Collection</p>
          <h1 className="text-4xl md:text-6xl font-black tracking-tight mb-4">
            <span className="text-white">Participate in the </span>
            <span className="gradient-text">K-RAID</span>
            <span className="text-white"> Study</span>
          </h1>
          <p className="text-muted-foreground text-lg max-w-xl mx-auto leading-relaxed">
            Watch each kabaddi video carefully, respond to the research questions based on your expertise, and submit your data to support our study.
          </p>
        </div>

        {/* Step indicator */}
        <div className="flex items-center justify-center gap-2 text-xs text-muted-foreground">
          <div className="flex items-center gap-1.5">
            <span className="w-5 h-5 rounded-full bg-primary text-white font-bold flex items-center justify-center text-[10px]">1</span>
            <span>Personal Details</span>
          </div>
          <IconChevronRight />
          <div className="flex items-center gap-1.5">
            <span className="w-5 h-5 rounded-full bg-muted text-muted-foreground font-bold flex items-center justify-center text-[10px]">2</span>
            <span>Watch & Answer</span>
          </div>
          <IconChevronRight />
          <div className="flex items-center gap-1.5">
            <span className="w-5 h-5 rounded-full bg-muted text-muted-foreground font-bold flex items-center justify-center text-[10px]">3</span>
            <span>Submit</span>
          </div>
        </div>

        {/* Personal Details */}
        <section className="bg-card border border-card-border rounded-2xl overflow-hidden shadow-lg card-hover">
          <div className="px-6 py-4 border-b border-border/60 bg-muted/20 flex items-center gap-3">
            <div className="w-7 h-7 rounded-full bg-primary/20 border border-primary/30 flex items-center justify-center text-primary">
              <IconUser />
            </div>
            <div>
              <h3 className="font-bold text-foreground">Personal Details</h3>
              <p className="text-xs text-muted-foreground">Participant information for this research</p>
            </div>
          </div>
          <div className="p-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              <div>
                <label className="block text-sm font-semibold text-foreground mb-2">Full Name <span className="text-destructive">*</span></label>
                <input
                  type="text" required value={name} onChange={(e) => setName(e.target.value)}
                  placeholder="Enter your full name"
                  className="w-full px-4 py-3 bg-background border border-input rounded-xl text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary/50 transition-all"
                />
              </div>
              <div>
                <label className="block text-sm font-semibold text-foreground mb-2">District <span className="text-destructive">*</span></label>
                <input
                  type="text" required value={district} onChange={(e) => setDistrict(e.target.value)}
                  placeholder="Enter your district"
                  className="w-full px-4 py-3 bg-background border border-input rounded-xl text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary/50 transition-all"
                />
              </div>
              <div>
                <label className="block text-sm font-semibold text-foreground mb-2">State <span className="text-destructive">*</span></label>
                <select
                  required value={state} onChange={(e) => setState(e.target.value)}
                  className="w-full px-4 py-3 bg-background border border-input rounded-xl text-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary/50 transition-all"
                >
                  <option value="" disabled>Select your state</option>
                  {INDIAN_STATES.map((s) => <option key={s} value={s}>{s}</option>)}
                </select>
              </div>
              <div>
                <label className="block text-sm font-semibold text-foreground mb-2">Designation <span className="text-destructive">*</span></label>
                <div className="flex gap-3 h-[50px]">
                  {(["player", "coach"] as const).map((d) => (
                    <button
                      key={d} type="button" onClick={() => setDesignation(d)}
                      className={`flex-1 rounded-xl border font-semibold text-sm capitalize transition-all ${
                        designation === d
                          ? "bg-primary border-primary text-white shadow-lg glow-primary-sm"
                          : "bg-background border-input text-muted-foreground hover:border-primary/50 hover:text-foreground"
                      }`}
                    >{d}</button>
                  ))}
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Videos + Questions */}
        {loading ? (
          <div className="text-center py-20">
            <div className="w-10 h-10 border-2 border-primary border-t-transparent rounded-full animate-spin mx-auto mb-4 glow-primary-sm"></div>
            <p className="text-muted-foreground">Loading videos and questions...</p>
          </div>
        ) : videos.length === 0 ? (
          <div className="text-center py-16 bg-card border border-card-border rounded-2xl">
            <div className="w-16 h-16 rounded-2xl bg-muted flex items-center justify-center mx-auto mb-4 text-muted-foreground">
              <IconVideo />
            </div>
            <p className="text-foreground font-semibold">No videos available yet</p>
            <p className="text-muted-foreground text-sm mt-1">Please check back later.</p>
          </div>
        ) : (
          videos.map((video, idx) => (
            <section key={video.id} className="bg-card border border-card-border rounded-2xl overflow-hidden shadow-lg card-hover">
              <div className="px-6 py-4 border-b border-border/60 bg-muted/20 flex items-center gap-3">
                <div className="w-7 h-7 rounded-full bg-primary/20 border border-primary/30 flex items-center justify-center text-primary font-bold text-xs">
                  {idx + 2}
                </div>
                <div>
                  <h3 className="font-bold text-foreground">{video.title}</h3>
                  <p className="text-xs text-muted-foreground">{video.questions.length} questions to answer</p>
                </div>
              </div>
              <div className="p-6 space-y-6">
                {/* Video Player */}
                <div className="rounded-xl overflow-hidden border border-border/60 bg-black aspect-video shadow-lg">
                  <video controls className="w-full h-full" src={video.url} preload="metadata">
                    Your browser does not support the video tag.
                  </video>
                </div>
                {/* Questions */}
                <div className="space-y-5">
                  {video.questions.map((q, qi) => (
                    <div key={qi} className="space-y-2">
                      <label className="flex items-start gap-2 text-sm font-semibold text-foreground">
                        <span className="mt-0.5 flex-shrink-0 w-5 h-5 rounded bg-primary/20 border border-primary/30 text-primary text-[10px] font-bold flex items-center justify-center">Q{qi + 1}</span>
                        <span>{q.question_text} <span className="text-destructive">*</span></span>
                      </label>
                      <textarea
                        required rows={6}
                        value={answers[answerKey(video.id, qi)] || ""}
                        onChange={(e) => setAnswer(video.id, qi, e.target.value)}
                        placeholder="Provide a detailed, thoughtful answer based on your expertise..."
                        className="w-full px-4 py-3 bg-background border border-input rounded-xl text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary/50 transition-all resize-y min-h-[140px] text-sm leading-relaxed"
                      />
                    </div>
                  ))}
                  {video.questions.length === 0 && (
                    <p className="text-muted-foreground text-sm italic text-center py-4">No questions configured for this video.</p>
                  )}
                </div>
              </div>
            </section>
          ))
        )}

        {/* Submit */}
        {!loading && videos.length > 0 && (
          <div className="pb-12">
            <button
              type="submit" disabled={submitting}
              className="w-full py-4 bg-primary text-white font-bold text-base rounded-xl hover:bg-primary/90 disabled:opacity-50 disabled:cursor-not-allowed transition-all shadow-lg glow-primary flex items-center justify-center gap-3"
            >
              {submitting ? <><IconLoader /> Submitting...</> : "Submit Research Data"}
            </button>
            <p className="text-center text-muted-foreground text-xs mt-4">
              All fields are required. Ensure all questions are answered before submitting your data.
            </p>
          </div>
        )}
      </form>

      {/* Footer */}
      <footer className="border-t border-border/40 py-6">
        <p className="text-center text-xs text-muted-foreground">K-RAID &mdash; Kabaddi Research & Analytics in India &bull; Final Year Project Data Collection</p>
      </footer>
    </div>
  );
}

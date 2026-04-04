import { useState, useEffect, useRef } from "react";
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
type Video = { id: number; title: string; order: number; questions: QuestionItem[] };
type Step = "welcome" | "details" | "video" | "thankyou";

function IconLoader() {
  return (
    <svg className="animate-spin" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
      <path d="M21 12a9 9 0 1 1-6.219-8.56"/>
    </svg>
  );
}

function IconArrowRight() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
      <path d="M5 12h14M12 5l7 7-7 7"/>
    </svg>
  );
}

function IconArrowLeft() {
  return (
    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
      <path d="M19 12H5M12 19l-7-7 7-7"/>
    </svg>
  );
}

function IconCheck() {
  return (
    <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
      <polyline points="20 6 9 17 4 12"/>
    </svg>
  );
}

/* ── Progress bar at top ── */
function ProgressBar({ step, videoIndex, totalVideos }: { step: Step; videoIndex: number; totalVideos: number }) {
  const totalSteps = 2 + totalVideos; // details + videos
  let filled = 0;
  if (step === "welcome") filled = 0;
  else if (step === "details") filled = 1;
  else if (step === "video") filled = 2 + videoIndex;
  else if (step === "thankyou") filled = totalSteps;

  const pct = totalSteps > 0 ? Math.round((filled / totalSteps) * 100) : 0;

  return (
    <div className="w-full h-1 bg-muted/40 fixed top-0 left-0 z-50">
      <div
        className="h-full bg-primary transition-all duration-500 ease-out glow-primary-sm"
        style={{ width: `${pct}%` }}
      />
    </div>
  );
}

export default function Home() {
  const { toast } = useToast();
  const topRef = useRef<HTMLDivElement>(null);

  const [step, setStep] = useState<Step>("welcome");
  const [videoIndex, setVideoIndex] = useState(0);
  const [videos, setVideos] = useState<Video[]>([]);
  const [loading, setLoading] = useState(true);

  const [name, setName] = useState("");
  const [district, setDistrict] = useState("");
  const [state, setState] = useState("");
  const [designation, setDesignation] = useState<"player" | "coach" | "">("");
  const [answers, setAnswers] = useState<Record<string, string>>({});

  const [videoSrcs, setVideoSrcs] = useState<Record<number, string>>({});
  const [loadingVideo, setLoadingVideo] = useState<Record<number, boolean>>({});

  const [submitting, setSubmitting] = useState(false);

  useEffect(() => { fetchVideos(); }, []);

  function scrollTop() {
    setTimeout(() => topRef.current?.scrollIntoView({ behavior: "smooth" }), 50);
  }

  async function fetchVideos() {
    setLoading(true);
    const { data: vids } = await supabase
      .from("videos")
      .select("id,title,order,questions")
      .order("order", { ascending: true });
    setVideos((vids || []).map((v) => ({ ...v, questions: Array.isArray(v.questions) ? v.questions : [] })));
    setLoading(false);
  }

  async function loadVideoSrc(videoId: number) {
    if (videoSrcs[videoId] || loadingVideo[videoId]) return;
    setLoadingVideo((prev) => ({ ...prev, [videoId]: true }));
    const { data, error } = await supabase.from("videos").select("url").eq("id", videoId).single();
    if (error || !data?.url) {
      toast({ title: "Failed to load video", description: "Could not retrieve video data.", variant: "destructive" });
    } else {
      setVideoSrcs((prev) => ({ ...prev, [videoId]: data.url }));
    }
    setLoadingVideo((prev) => ({ ...prev, [videoId]: false }));
  }

  function answerKey(videoId: number, qIndex: number) {
    return `${videoId}_${qIndex}`;
  }

  function setAnswer(videoId: number, qIndex: number, value: string) {
    setAnswers((prev) => ({ ...prev, [answerKey(videoId, qIndex)]: value }));
  }

  /* ── Navigation ── */
  function goToDetails() {
    setStep("details");
    scrollTop();
  }

  function goToVideos() {
    if (!name.trim() || !district.trim() || !state || !designation) {
      toast({ title: "Missing Information", description: "Please fill in all personal details.", variant: "destructive" });
      return;
    }
    setVideoIndex(0);
    setStep("video");
    scrollTop();
  }

  function goNextVideo() {
    const video = videos[videoIndex];
    for (let qi = 0; qi < video.questions.length; qi++) {
      if (!answers[answerKey(video.id, qi)]?.trim()) {
        toast({ title: "Answer Required", description: "Please answer all questions before continuing.", variant: "destructive" });
        return;
      }
    }
    if (videoIndex < videos.length - 1) {
      setVideoIndex((i) => i + 1);
      scrollTop();
    } else {
      handleSubmit();
    }
  }

  function goPrevVideo() {
    if (videoIndex > 0) {
      setVideoIndex((i) => i - 1);
      scrollTop();
    } else {
      setStep("details");
      scrollTop();
    }
  }

  async function handleSubmit() {
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
      toast({ title: "Partial Error", description: "Details saved but some answers failed to save.", variant: "destructive" });
    }
    setStep("thankyou");
    scrollTop();
  }

  function resetForm() {
    setStep("welcome");
    setVideoIndex(0);
    setName(""); setDistrict(""); setState(""); setDesignation("");
    setAnswers({});
    setVideoSrcs({});
    scrollTop();
  }

  const currentVideo = videos[videoIndex];
  const isLastVideo = videoIndex === videos.length - 1;

  return (
    <div className="min-h-screen bg-background text-foreground" ref={topRef}>
      <ProgressBar step={step} videoIndex={videoIndex} totalVideos={videos.length} />
      <div className="fixed top-0 left-1/2 -translate-x-1/2 w-[600px] h-[200px] bg-primary/8 rounded-full blur-3xl pointer-events-none" />

      {/* Header */}
      <header className="site-header relative pt-1">
        <div className="max-w-3xl mx-auto px-4 h-16 flex items-center justify-between relative z-10">
          <div className="flex items-center gap-3">
            <div className="header-logo-icon">K</div>
            <div className="flex items-center gap-2.5">
              <span className="header-logo-text">K-RAID</span>
              <span className="text-xs text-muted-foreground hidden sm:inline tracking-wide">Kabaddi Research Study</span>
            </div>
          </div>
          {step !== "welcome" && step !== "thankyou" && (
            <div className="text-xs text-muted-foreground font-medium">
              {step === "details" && "Step 1 of " + (videos.length + 1)}
              {step === "video" && `Step ${videoIndex + 2} of ${videos.length + 1}`}
            </div>
          )}
          {(step === "welcome" || step === "thankyou") && (
            <div className="header-status-pill">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse inline-block"></span>
              Data Collection Active
            </div>
          )}
        </div>
      </header>

      <div className="max-w-3xl mx-auto px-4 py-12 relative">

        {/* ══ WELCOME ══ */}
        {step === "welcome" && (
          <div className="flex flex-col items-center justify-center min-h-[70vh] text-center">
            <p className="text-xs font-semibold tracking-[0.3em] text-primary uppercase mb-6">Final Year Research Project &mdash; Data Collection</p>
            <h1 className="text-5xl md:text-7xl font-black tracking-tight mb-6 leading-none">
              <span className="text-white">Welcome to </span>
              <span className="gradient-text">K-RAID</span>
            </h1>
            <p className="text-muted-foreground text-lg max-w-lg mx-auto leading-relaxed mb-4">
              Kabaddi Research & Analytics in India
            </p>
            <p className="text-muted-foreground text-base max-w-md mx-auto leading-relaxed mb-10">
              You will watch {loading ? "a series of" : videos.length} kabaddi videos and answer research questions based on your expertise. The process takes about 10–15 minutes.
            </p>
            <button
              onClick={goToDetails}
              className="flex items-center gap-3 px-10 py-4 bg-primary text-white font-bold text-lg rounded-2xl hover:bg-primary/90 transition-all shadow-xl glow-primary"
            >
              Begin Study <IconArrowRight />
            </button>
            <p className="text-muted-foreground text-xs mt-6">All responses are confidential and used only for academic research.</p>
          </div>
        )}

        {/* ══ DETAILS ══ */}
        {step === "details" && (
          <div className="space-y-8">
            <div className="text-center">
              <p className="text-xs font-semibold tracking-[0.2em] text-primary uppercase mb-3">Step 1 &mdash; Participant Information</p>
              <h2 className="text-3xl md:text-4xl font-black text-foreground mb-2">Your Details</h2>
              <p className="text-muted-foreground">Please provide your information to begin the study.</p>
            </div>

            <div className="bg-card border border-card-border rounded-2xl p-6 shadow-lg space-y-5">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                <div>
                  <label className="block text-sm font-semibold text-foreground mb-2">Full Name <span className="text-destructive">*</span></label>
                  <input
                    type="text" value={name} onChange={(e) => setName(e.target.value)}
                    placeholder="Enter your full name"
                    className="w-full px-4 py-3 bg-background border border-input rounded-xl text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary/50 transition-all"
                  />
                </div>
                <div>
                  <label className="block text-sm font-semibold text-foreground mb-2">District <span className="text-destructive">*</span></label>
                  <input
                    type="text" value={district} onChange={(e) => setDistrict(e.target.value)}
                    placeholder="Enter your district"
                    className="w-full px-4 py-3 bg-background border border-input rounded-xl text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary/50 transition-all"
                  />
                </div>
                <div>
                  <label className="block text-sm font-semibold text-foreground mb-2">State <span className="text-destructive">*</span></label>
                  <select
                    value={state} onChange={(e) => setState(e.target.value)}
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

            <div className="flex gap-3">
              <button
                type="button"
                onClick={() => { setStep("welcome"); scrollTop(); }}
                className="flex items-center gap-2 px-6 py-3 bg-muted text-muted-foreground font-semibold rounded-xl hover:bg-muted/80 hover:text-foreground transition-all"
              >
                <IconArrowLeft /> Back
              </button>
              <button
                type="button"
                onClick={goToVideos}
                disabled={loading}
                className="flex-1 flex items-center justify-center gap-2 py-3 bg-primary text-white font-bold rounded-xl hover:bg-primary/90 disabled:opacity-50 transition-all shadow-lg glow-primary-sm"
              >
                {loading ? <><IconLoader /> Loading videos...</> : <>Continue <IconArrowRight /></>}
              </button>
            </div>
          </div>
        )}

        {/* ══ VIDEO STEP ══ */}
        {step === "video" && currentVideo && (
          <div className="space-y-8">
            {/* Video header */}
            <div className="text-center">
              <p className="text-xs font-semibold tracking-[0.2em] text-primary uppercase mb-3">
                Video {videoIndex + 1} of {videos.length}
              </p>
              <h2 className="text-2xl md:text-3xl font-black text-foreground mb-2">{currentVideo.title}</h2>
              <p className="text-muted-foreground text-sm">Watch the video carefully, then answer the questions below.</p>
            </div>

            {/* Video dot indicator */}
            {videos.length > 1 && (
              <div className="flex justify-center gap-2">
                {videos.map((_, i) => (
                  <div
                    key={i}
                    className={`h-1.5 rounded-full transition-all duration-300 ${
                      i < videoIndex ? "bg-primary w-6" : i === videoIndex ? "bg-primary w-8" : "bg-muted w-4"
                    }`}
                  />
                ))}
              </div>
            )}

            {/* Video player */}
            <div className="bg-card border border-card-border rounded-2xl overflow-hidden shadow-lg">
              <div className="aspect-video bg-black relative">
                {videoSrcs[currentVideo.id] ? (
                  <video controls autoPlay className="w-full h-full" src={videoSrcs[currentVideo.id]}>
                    Your browser does not support the video tag.
                  </video>
                ) : (
                  <button
                    type="button"
                    onClick={() => loadVideoSrc(currentVideo.id)}
                    disabled={loadingVideo[currentVideo.id]}
                    className="absolute inset-0 w-full h-full flex flex-col items-center justify-center gap-3 hover:bg-white/5 transition-colors group"
                  >
                    {loadingVideo[currentVideo.id] ? (
                      <>
                        <div className="w-14 h-14 border-2 border-primary border-t-transparent rounded-full animate-spin glow-primary-sm" />
                        <span className="text-muted-foreground text-sm">Loading video...</span>
                      </>
                    ) : (
                      <>
                        <div className="w-20 h-20 rounded-full bg-primary/20 border-2 border-primary/50 flex items-center justify-center group-hover:bg-primary/30 group-hover:border-primary transition-all glow-primary-sm">
                          <svg width="32" height="32" viewBox="0 0 24 24" fill="currentColor" className="text-primary ml-1.5">
                            <polygon points="5 3 19 12 5 21 5 3"/>
                          </svg>
                        </div>
                        <span className="text-muted-foreground text-sm group-hover:text-foreground transition-colors">Click to load &amp; play video</span>
                      </>
                    )}
                  </button>
                )}
              </div>

              {/* Questions */}
              <div className="p-6 space-y-6 border-t border-border/60">
                <p className="text-xs font-semibold text-muted-foreground uppercase tracking-wider">Research Questions</p>
                {currentVideo.questions.map((q, qi) => (
                  <div key={qi} className="space-y-2">
                    <label className="flex items-start gap-2 text-sm font-semibold text-foreground">
                      <span className="mt-0.5 flex-shrink-0 w-6 h-6 rounded-lg bg-primary/20 border border-primary/30 text-primary text-[11px] font-bold flex items-center justify-center">
                        Q{qi + 1}
                      </span>
                      <span>{q.question_text} <span className="text-destructive">*</span></span>
                    </label>
                    <textarea
                      rows={5}
                      value={answers[answerKey(currentVideo.id, qi)] || ""}
                      onChange={(e) => setAnswer(currentVideo.id, qi, e.target.value)}
                      placeholder="Provide a detailed, thoughtful answer based on your expertise..."
                      className="w-full px-4 py-3 bg-background border border-input rounded-xl text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary/50 transition-all resize-y min-h-[120px] text-sm leading-relaxed"
                    />
                  </div>
                ))}
                {currentVideo.questions.length === 0 && (
                  <p className="text-muted-foreground text-sm italic text-center py-4">No questions for this video.</p>
                )}
              </div>
            </div>

            {/* Navigation */}
            <div className="flex gap-3 pb-8">
              <button
                type="button"
                onClick={goPrevVideo}
                className="flex items-center gap-2 px-6 py-3 bg-muted text-muted-foreground font-semibold rounded-xl hover:bg-muted/80 hover:text-foreground transition-all"
              >
                <IconArrowLeft /> Back
              </button>
              <button
                type="button"
                onClick={goNextVideo}
                disabled={submitting}
                className="flex-1 flex items-center justify-center gap-2 py-3 bg-primary text-white font-bold rounded-xl hover:bg-primary/90 disabled:opacity-50 transition-all shadow-lg glow-primary-sm"
              >
                {submitting ? (
                  <><IconLoader /> Submitting...</>
                ) : isLastVideo ? (
                  <>Submit Research Data <IconArrowRight /></>
                ) : (
                  <>Next Video <IconArrowRight /></>
                )}
              </button>
            </div>
          </div>
        )}

        {/* ══ NO VIDEOS ══ */}
        {step === "video" && !loading && videos.length === 0 && (
          <div className="text-center py-20">
            <div className="w-16 h-16 rounded-2xl bg-muted flex items-center justify-center mx-auto mb-4 text-muted-foreground">
              <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round">
                <rect x="2" y="6" width="14" height="12" rx="2"/><path d="m22 8-6 4 6 4V8z"/>
              </svg>
            </div>
            <p className="text-foreground font-semibold">No videos available yet</p>
            <p className="text-muted-foreground text-sm mt-1">Please check back later.</p>
          </div>
        )}

        {/* ══ THANK YOU ══ */}
        {step === "thankyou" && (
          <div className="flex flex-col items-center justify-center min-h-[70vh] text-center">
            <div className="w-24 h-24 rounded-full bg-primary/10 border-2 border-primary/30 flex items-center justify-center mx-auto mb-8 glow-primary-sm text-primary">
              <IconCheck />
            </div>
            <p className="text-xs font-semibold tracking-[0.3em] text-primary uppercase mb-4">Study Complete</p>
            <h2 className="text-4xl md:text-5xl font-black text-foreground mb-4">Thank You!</h2>
            <p className="text-muted-foreground text-lg max-w-sm mx-auto mb-2">Your responses have been recorded successfully.</p>
            <p className="text-muted-foreground text-sm max-w-sm mx-auto mb-10">
              Thank you for contributing to the K-RAID research study. Your expertise will help advance kabaddi analytics in India.
            </p>
            <button
              onClick={resetForm}
              className="flex items-center gap-2 px-8 py-3 bg-primary text-white font-bold rounded-xl hover:bg-primary/90 transition-all glow-primary-sm"
            >
              Submit Another Response
            </button>
          </div>
        )}
      </div>

      <footer className="border-t border-border/40 py-6">
        <p className="text-center text-xs text-muted-foreground">K-RAID &mdash; Kabaddi Research & Analytics in India &bull; Final Year Project Data Collection</p>
      </footer>
    </div>
  );
}

import { useState, useEffect, useRef } from "react";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";

type Video = { id: number; title: string; url: string; order: number };
type Question = { id: number; video_id: number; question_text: string; order: number };
type Submission = { id: number; name: string; district: string; state: string; designation: string; submitted_at: string };
type Response = { id: number; submission_id: number; question_id: number; answer_text: string };

const ADMIN_PASSWORD = "kraid@2025";

/* ─── Icons ─── */
function IconLock() {
  return <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>;
}
function IconPlus() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg>;
}
function IconTrash() {
  return <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a1 1 0 0 1 1-1h4a1 1 0 0 1 1 1v2"/></svg>;
}
function IconChevronDown() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="6 9 12 15 18 9"/></svg>;
}
function IconDownload() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="7 10 12 15 17 10"/><line x1="12" y1="15" x2="12" y2="3"/></svg>;
}
function IconX() {
  return <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>;
}
function IconLogOut() {
  return <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>;
}
function IconUpload() {
  return <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>;
}
function IconLoader() {
  return <svg className="animate-spin" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2"><path d="M21 12a9 9 0 1 1-6.219-8.56"/></svg>;
}
function IconFilm() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><rect x="2" y="2" width="20" height="20" rx="2.18" ry="2.18"/><line x1="7" y1="2" x2="7" y2="22"/><line x1="17" y1="2" x2="17" y2="22"/><line x1="2" y1="12" x2="22" y2="12"/><line x1="2" y1="7" x2="7" y2="7"/><line x1="2" y1="17" x2="7" y2="17"/><line x1="17" y1="17" x2="22" y2="17"/><line x1="17" y1="7" x2="22" y2="7"/></svg>;
}
function IconUsers() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>;
}
function IconHelpCircle() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><circle cx="12" cy="12" r="10"/><path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>;
}
function IconMessageSquare() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>;
}
function IconEye() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>;
}

/* ─── Login ─── */
function LoginScreen({ onLogin }: { onLogin: () => void }) {
  const [pw, setPw] = useState("");
  const [err, setErr] = useState(false);
  function attempt(e: React.FormEvent) {
    e.preventDefault();
    if (pw === ADMIN_PASSWORD) { onLogin(); }
    else { setErr(true); setPw(""); }
  }
  return (
    <div className="min-h-screen bg-background flex items-center justify-center px-4">
      <div className="fixed top-0 left-1/2 -translate-x-1/2 w-[400px] h-[200px] bg-primary/8 rounded-full blur-3xl pointer-events-none" />
      <div className="w-full max-w-sm relative">
        <div className="text-center mb-8">
          <div className="w-14 h-14 rounded-2xl bg-primary flex items-center justify-center font-black text-white text-2xl mx-auto mb-4 glow-primary-sm">K</div>
          <h1 className="text-2xl font-black text-foreground">Management Portal</h1>
          <p className="text-muted-foreground text-sm mt-1">K-RAID Administration</p>
        </div>
        <form onSubmit={attempt} className="bg-card border border-card-border rounded-2xl p-6 shadow-xl space-y-4">
          <div>
            <label className="block text-sm font-semibold text-foreground mb-2 flex items-center gap-1.5">
              <span className="text-primary"><IconLock /></span> Access Code
            </label>
            <input
              type="password" value={pw} onChange={(e) => { setPw(e.target.value); setErr(false); }}
              placeholder="Enter access code"
              className="w-full px-4 py-3 bg-background border border-input rounded-xl text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 focus:border-primary/50 transition-all"
            />
            {err && <p className="text-destructive text-xs mt-1.5">Incorrect access code. Please try again.</p>}
          </div>
          <button type="submit" className="w-full py-3 bg-primary text-white font-bold rounded-xl hover:bg-primary/90 transition-colors glow-primary-sm">
            Access Dashboard
          </button>
        </form>
      </div>
    </div>
  );
}

/* ─── Main Admin ─── */
export default function Admin() {
  const { toast } = useToast();
  const [authed, setAuthed] = useState(false);
  const [tab, setTab] = useState<"videos" | "responses">("videos");

  const [videos, setVideos] = useState<Video[]>([]);
  const [questions, setQuestions] = useState<Question[]>([]);
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [responses, setResponses] = useState<Response[]>([]);
  const [loading, setLoading] = useState(false);

  const [newVideoTitle, setNewVideoTitle] = useState("");
  const [videoFile, setVideoFile] = useState<File | null>(null);
  const [uploading, setUploading] = useState(false);
  const [uploadProgress, setUploadProgress] = useState(0);
  const [showAddVideo, setShowAddVideo] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const [newQText, setNewQText] = useState("");
  const [newQVideoId, setNewQVideoId] = useState<number | null>(null);
  const [addingQ, setAddingQ] = useState(false);

  const [expandedSub, setExpandedSub] = useState<number | null>(null);
  const [expandedVideo, setExpandedVideo] = useState<number | null>(null);

  useEffect(() => { if (authed) fetchAll(); }, [authed]);

  async function fetchAll() {
    setLoading(true);
    const [v, q, s, r] = await Promise.all([
      supabase.from("videos").select("*").order("order"),
      supabase.from("questions").select("*").order("order"),
      supabase.from("submissions").select("*").order("submitted_at", { ascending: false }),
      supabase.from("responses").select("*"),
    ]);
    setVideos(v.data || []);
    setQuestions(q.data || []);
    setSubmissions(s.data || []);
    setResponses(r.data || []);
    setLoading(false);
  }

  async function addVideo(e: React.FormEvent) {
    e.preventDefault();
    if (!newVideoTitle.trim() || !videoFile) {
      toast({ title: "Missing fields", description: "Please provide a title and select a video file.", variant: "destructive" });
      return;
    }
    setUploading(true);
    setUploadProgress(10);

    const ext = videoFile.name.split(".").pop();
    const fileName = `video_${Date.now()}.${ext}`;

    const { error: uploadErr } = await supabase.storage
      .from("videos")
      .upload(fileName, videoFile, { contentType: videoFile.type, upsert: false });

    if (uploadErr) {
      setUploading(false);
      toast({ title: "Upload Failed", description: uploadErr.message, variant: "destructive" });
      return;
    }
    setUploadProgress(70);

    const { data: urlData } = supabase.storage.from("videos").getPublicUrl(fileName);
    const publicUrl = urlData.publicUrl;

    const maxOrder = videos.reduce((m, v) => Math.max(m, v.order), 0);
    const { error: insertErr } = await supabase.from("videos").insert([{ title: newVideoTitle.trim(), url: publicUrl, order: maxOrder + 1 }]);

    setUploading(false);
    setUploadProgress(0);

    if (insertErr) {
      toast({ title: "Error", description: insertErr.message, variant: "destructive" });
      return;
    }

    setNewVideoTitle(""); setVideoFile(null);
    if (fileInputRef.current) fileInputRef.current.value = "";
    setShowAddVideo(false);
    toast({ title: "Video uploaded successfully" });
    fetchAll();
  }

  async function deleteVideo(id: number) {
    if (!confirm("Delete this video and all its questions?")) return;
    await supabase.from("videos").delete().eq("id", id);
    toast({ title: "Video deleted" });
    fetchAll();
  }

  async function addQuestion(e: React.FormEvent, videoId: number) {
    e.preventDefault();
    if (!newQText.trim() || !videoId) return;
    setAddingQ(true);
    const videoQs = questions.filter((q) => q.video_id === videoId);
    const maxOrder = videoQs.reduce((m, q) => Math.max(m, q.order), 0);
    const { error } = await supabase.from("questions").insert([{ video_id: videoId, question_text: newQText.trim(), order: maxOrder + 1 }]);
    setAddingQ(false);
    if (error) { toast({ title: "Error", description: error.message, variant: "destructive" }); return; }
    setNewQText(""); setNewQVideoId(null);
    toast({ title: "Question added" });
    fetchAll();
  }

  async function deleteQuestion(id: number) {
    if (!confirm("Delete this question?")) return;
    await supabase.from("questions").delete().eq("id", id);
    toast({ title: "Question deleted" });
    fetchAll();
  }

  function exportCSV() {
    const rows: string[][] = [];
    rows.push(["Submission ID","Name","District","State","Designation","Submitted At","Question ID","Question","Answer"]);
    for (const sub of submissions) {
      const subResponses = responses.filter((r) => r.submission_id === sub.id);
      if (subResponses.length === 0) {
        rows.push([String(sub.id), sub.name, sub.district, sub.state, sub.designation, sub.submitted_at, "", "", ""]);
      } else {
        for (const resp of subResponses) {
          const q = questions.find((q) => q.id === resp.question_id);
          rows.push([String(sub.id), sub.name, sub.district, sub.state, sub.designation, sub.submitted_at, String(resp.question_id), q?.question_text || "", resp.answer_text]);
        }
      }
    }
    const csv = rows.map((row) => row.map((c) => `"${String(c).replace(/"/g, '""')}"`).join(",")).join("\n");
    const blob = new Blob([csv], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url; a.download = "k-raid-responses.csv"; a.click();
    URL.revokeObjectURL(url);
  }

  if (!authed) return <LoginScreen onLogin={() => setAuthed(true)} />;

  const statCards = [
    { label: "Videos", value: videos.length, icon: <IconFilm />, color: "text-primary" },
    { label: "Questions", value: questions.length, icon: <IconHelpCircle />, color: "text-cyan-400" },
    { label: "Submissions", value: submissions.length, icon: <IconUsers />, color: "text-emerald-400" },
    { label: "Responses", value: responses.length, icon: <IconMessageSquare />, color: "text-violet-400" },
  ];

  return (
    <div className="min-h-screen bg-background text-foreground">
      <div className="fixed top-0 left-1/2 -translate-x-1/2 w-[500px] h-[180px] bg-primary/6 rounded-full blur-3xl pointer-events-none" />

      {/* Header */}
      <header className="sticky top-0 z-50 bg-background/80 backdrop-blur-xl border-b border-border/60">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-9 h-9 rounded-lg bg-primary flex items-center justify-center font-black text-white text-base glow-primary-sm">K</div>
            <div>
              <span className="text-base font-black tracking-widest text-white">K-RAID</span>
              <span className="ml-2 text-xs font-semibold text-primary bg-primary/10 px-2 py-0.5 rounded-full border border-primary/20">Admin</span>
            </div>
          </div>
          <div className="flex items-center gap-2">
            <a href="/" className="flex items-center gap-1.5 text-xs text-muted-foreground hover:text-foreground px-3 py-1.5 border border-border rounded-lg hover:border-border/80 transition-colors">
              <IconEye /> View Site
            </a>
            <button onClick={() => setAuthed(false)} className="flex items-center gap-1.5 text-xs text-muted-foreground hover:text-destructive px-3 py-1.5 border border-border rounded-lg hover:border-destructive/50 transition-colors">
              <IconLogOut /> Logout
            </button>
          </div>
        </div>
      </header>

      <div className="max-w-6xl mx-auto px-4 py-8 relative">
        {/* Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
          {statCards.map((s) => (
            <div key={s.label} className="bg-card border border-card-border rounded-xl p-4 shadow-sm card-hover">
              <div className={`mb-2 ${s.color}`}>{s.icon}</div>
              <div className="text-3xl font-black text-foreground tabular-nums">{s.value}</div>
              <div className="text-muted-foreground text-xs mt-0.5">{s.label}</div>
            </div>
          ))}
        </div>

        {/* Tabs */}
        <div className="flex gap-2 mb-6">
          {([["videos", "Videos & Questions", <IconFilm />], ["responses", "Submissions", <IconUsers />]] as const).map(([t, label, icon]) => (
            <button
              key={t} onClick={() => setTab(t as "videos" | "responses")}
              className={`flex items-center gap-2 px-4 py-2 rounded-lg font-semibold text-sm transition-all ${
                tab === t
                  ? "bg-primary text-white shadow-md glow-primary-sm"
                  : "bg-card border border-card-border text-muted-foreground hover:text-foreground hover:border-primary/30"
              }`}
            >
              {icon}{label}
            </button>
          ))}
        </div>

        {/* ── Videos Tab ── */}
        {tab === "videos" && (
          <div className="space-y-5">
            <div className="flex items-center justify-between">
              <h2 className="text-lg font-bold text-foreground">Manage Videos</h2>
              <button
                onClick={() => setShowAddVideo(!showAddVideo)}
                className="flex items-center gap-2 px-4 py-2 bg-primary text-white font-semibold text-sm rounded-lg hover:bg-primary/90 transition-colors glow-primary-sm"
              >
                <IconPlus /> Add Video
              </button>
            </div>

            {/* Add Video Form */}
            {showAddVideo && (
              <div className="bg-card border border-primary/30 rounded-xl p-5 shadow-lg">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="font-bold text-foreground text-sm">Upload New Video</h3>
                  <button type="button" onClick={() => setShowAddVideo(false)} className="text-muted-foreground hover:text-foreground">
                    <IconX />
                  </button>
                </div>
                <form onSubmit={addVideo} className="space-y-4">
                  <div>
                    <label className="block text-sm font-semibold text-foreground mb-1.5">Video Title <span className="text-destructive">*</span></label>
                    <input
                      value={newVideoTitle} onChange={(e) => setNewVideoTitle(e.target.value)}
                      placeholder="e.g. Video 1: Introduction to Kabaddi"
                      className="w-full px-3 py-2.5 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 text-sm transition-all"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-foreground mb-1.5">Video File <span className="text-destructive">*</span></label>
                    <div className="flex items-center gap-3">
                      <button
                        type="button"
                        onClick={() => fileInputRef.current?.click()}
                        className="flex items-center gap-2 px-5 py-2.5 bg-primary/10 border border-primary/30 text-primary font-semibold text-sm rounded-lg hover:bg-primary/20 hover:border-primary/60 transition-all glow-primary-sm"
                      >
                        <IconFilm />
                        Summon Video
                      </button>
                      {videoFile ? (
                        <div className="flex items-center gap-2 flex-1 min-w-0">
                          <span className="text-foreground text-sm font-medium truncate">{videoFile.name}</span>
                          <span className="text-muted-foreground text-xs flex-shrink-0">{(videoFile.size / (1024 * 1024)).toFixed(1)} MB</span>
                          <button type="button" onClick={() => { setVideoFile(null); if (fileInputRef.current) fileInputRef.current.value = ""; }} className="text-muted-foreground hover:text-destructive flex-shrink-0 transition-colors">
                            <IconX />
                          </button>
                        </div>
                      ) : (
                        <span className="text-muted-foreground text-sm">No file selected</span>
                      )}
                      <input
                        ref={fileInputRef} type="file" accept="video/*" className="hidden"
                        onChange={(e) => setVideoFile(e.target.files?.[0] || null)}
                      />
                    </div>
                    <p className="text-xs text-muted-foreground/60 mt-1.5">Supports MP4, MOV, WebM</p>
                  </div>

                  {uploading && (
                    <div className="space-y-1.5">
                      <div className="flex items-center justify-between text-xs text-muted-foreground">
                        <span>Uploading to storage...</span>
                        <span>{uploadProgress}%</span>
                      </div>
                      <div className="h-1.5 bg-muted rounded-full overflow-hidden">
                        <div className="h-full bg-primary rounded-full transition-all duration-300 glow-primary-sm" style={{ width: `${uploadProgress}%` }} />
                      </div>
                    </div>
                  )}

                  <div className="flex gap-3">
                    <button type="submit" disabled={uploading}
                      className="flex items-center gap-2 px-5 py-2 bg-primary text-white font-semibold text-sm rounded-lg hover:bg-primary/90 disabled:opacity-50 transition-colors"
                    >
                      {uploading ? <><IconLoader /> Uploading...</> : <><IconUpload /> Upload & Save</>}
                    </button>
                    <button type="button" onClick={() => { setShowAddVideo(false); setVideoFile(null); setNewVideoTitle(""); }}
                      className="px-5 py-2 bg-muted text-muted-foreground font-semibold text-sm rounded-lg hover:bg-muted/80 transition-colors"
                    >
                      Cancel
                    </button>
                  </div>
                </form>
              </div>
            )}

            {loading ? (
              <div className="text-center py-12 text-muted-foreground">
                <div className="w-6 h-6 border-2 border-primary border-t-transparent rounded-full animate-spin mx-auto mb-3"></div>
                Loading...
              </div>
            ) : videos.length === 0 ? (
              <div className="text-center py-12 bg-card border border-card-border rounded-xl text-muted-foreground">
                No videos yet. Add one above.
              </div>
            ) : (
              <div className="space-y-3">
                {videos.map((video) => {
                  const videoQs = questions.filter((q) => q.video_id === video.id);
                  const isExp = expandedVideo === video.id;
                  return (
                    <div key={video.id} className="bg-card border border-card-border rounded-xl overflow-hidden shadow-sm card-hover">
                      <div
                        className="p-4 flex items-center justify-between cursor-pointer hover:bg-muted/20 transition-colors"
                        onClick={() => setExpandedVideo(isExp ? null : video.id)}
                      >
                        <div className="flex items-center gap-3 min-w-0">
                          <div className="w-8 h-8 rounded-lg bg-primary/15 border border-primary/25 flex items-center justify-center text-primary text-xs font-bold flex-shrink-0">
                            {video.order}
                          </div>
                          <div className="min-w-0">
                            <p className="font-semibold text-foreground text-sm truncate">{video.title}</p>
                            <p className="text-xs text-muted-foreground truncate">{video.url}</p>
                          </div>
                        </div>
                        <div className="flex items-center gap-3 flex-shrink-0 ml-3">
                          <span className="text-xs text-muted-foreground bg-muted px-2 py-1 rounded-full hidden sm:block">
                            {videoQs.length} question{videoQs.length !== 1 ? "s" : ""}
                          </span>
                          <button
                            onClick={(e) => { e.stopPropagation(); deleteVideo(video.id); }}
                            className="text-muted-foreground hover:text-destructive transition-colors p-1.5 rounded-lg hover:bg-destructive/10"
                          >
                            <IconTrash />
                          </button>
                          <span className={`text-muted-foreground transition-transform duration-200 ${isExp ? "rotate-180" : ""}`}>
                            <IconChevronDown />
                          </span>
                        </div>
                      </div>

                      {isExp && (
                        <div className="border-t border-border/60 p-5 space-y-4 bg-background/30">
                          {/* Video preview */}
                          <div className="rounded-xl overflow-hidden border border-border/60 bg-black aspect-video max-h-48">
                            <video src={video.url} controls className="w-full h-full object-contain" preload="metadata" />
                          </div>

                          <h4 className="text-xs font-bold text-muted-foreground uppercase tracking-wider">Questions</h4>
                          {videoQs.length === 0 ? (
                            <p className="text-muted-foreground text-sm italic">No questions yet.</p>
                          ) : (
                            <div className="space-y-2">
                              {videoQs.map((q, qi) => (
                                <div key={q.id} className="flex items-start justify-between gap-3 bg-card rounded-lg px-3 py-2.5 border border-border/60">
                                  <div className="flex items-start gap-2 min-w-0">
                                    <span className="mt-0.5 flex-shrink-0 w-5 h-5 rounded bg-primary/15 border border-primary/25 text-primary text-[10px] font-bold flex items-center justify-center">Q{qi + 1}</span>
                                    <span className="text-foreground text-sm leading-relaxed">{q.question_text}</span>
                                  </div>
                                  <button onClick={() => deleteQuestion(q.id)} className="text-muted-foreground/60 hover:text-destructive flex-shrink-0 p-1 transition-colors">
                                    <IconX />
                                  </button>
                                </div>
                              ))}
                            </div>
                          )}

                          {/* Add Question */}
                          <form
                            onSubmit={(e) => { setNewQVideoId(video.id); addQuestion(e, video.id); }}
                            className="flex gap-2"
                          >
                            <input
                              value={newQVideoId === video.id ? newQText : ""}
                              onChange={(e) => { setNewQVideoId(video.id); setNewQText(e.target.value); }}
                              placeholder="Type a new question for this video..."
                              className="flex-1 px-3 py-2 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 text-sm transition-all"
                            />
                            <button type="submit" disabled={addingQ}
                              className="flex items-center gap-1.5 px-4 py-2 bg-primary text-white font-semibold text-sm rounded-lg hover:bg-primary/90 disabled:opacity-50 flex-shrink-0 transition-colors"
                            >
                              {addingQ ? <IconLoader /> : <IconPlus />} Add
                            </button>
                          </form>
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        )}

        {/* ── Responses Tab ── */}
        {tab === "responses" && (
          <div className="space-y-5">
            <div className="flex items-center justify-between">
              <h2 className="text-lg font-bold text-foreground">
                Submissions <span className="text-muted-foreground font-normal text-sm ml-1">({submissions.length})</span>
              </h2>
              <button
                onClick={exportCSV}
                className="flex items-center gap-2 px-4 py-2 bg-emerald-600 text-white font-semibold text-sm rounded-lg hover:bg-emerald-500 transition-colors shadow-md"
              >
                <IconDownload /> Export CSV
              </button>
            </div>

            {loading ? (
              <div className="text-center py-12 text-muted-foreground">
                <div className="w-6 h-6 border-2 border-primary border-t-transparent rounded-full animate-spin mx-auto mb-3"></div>
                Loading...
              </div>
            ) : submissions.length === 0 ? (
              <div className="text-center py-12 bg-card border border-card-border rounded-xl text-muted-foreground">
                No submissions yet.
              </div>
            ) : (
              <div className="space-y-3">
                {submissions.map((sub) => {
                  const subResponses = responses.filter((r) => r.submission_id === sub.id);
                  const isOpen = expandedSub === sub.id;
                  return (
                    <div key={sub.id} className="bg-card border border-card-border rounded-xl overflow-hidden shadow-sm card-hover">
                      <div
                        className="p-4 flex items-center justify-between cursor-pointer hover:bg-muted/20 transition-colors"
                        onClick={() => setExpandedSub(isOpen ? null : sub.id)}
                      >
                        <div className="flex items-center gap-3 min-w-0">
                          <div className="w-10 h-10 rounded-full bg-primary/15 border border-primary/25 flex items-center justify-center text-primary font-bold text-sm flex-shrink-0">
                            {sub.name.charAt(0).toUpperCase()}
                          </div>
                          <div className="min-w-0">
                            <p className="font-semibold text-foreground">{sub.name}</p>
                            <p className="text-xs text-muted-foreground">{sub.district}, {sub.state}</p>
                          </div>
                        </div>
                        <div className="flex items-center gap-3 flex-shrink-0 ml-3">
                          <span className={`text-xs font-semibold px-2.5 py-1 rounded-full capitalize border ${
                            sub.designation === "coach"
                              ? "bg-violet-500/15 text-violet-400 border-violet-500/25"
                              : "bg-primary/15 text-primary border-primary/25"
                          }`}>
                            {sub.designation}
                          </span>
                          <span className="text-xs text-muted-foreground hidden md:block">
                            {new Date(sub.submitted_at).toLocaleDateString("en-IN", { day: "numeric", month: "short", year: "numeric" })}
                          </span>
                          <span className="text-xs text-muted-foreground bg-muted px-2 py-1 rounded-full hidden sm:block">
                            {subResponses.length} answers
                          </span>
                          <span className={`text-muted-foreground transition-transform duration-200 ${isOpen ? "rotate-180" : ""}`}>
                            <IconChevronDown />
                          </span>
                        </div>
                      </div>

                      {isOpen && (
                        <div className="border-t border-border/60 p-5 space-y-5 bg-background/30">
                          {/* Details */}
                          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                            {[["Name", sub.name], ["District", sub.district], ["State", sub.state], ["Designation", sub.designation]].map(([label, value]) => (
                              <div key={label} className="bg-card border border-border/60 rounded-lg p-3">
                                <p className="text-xs text-muted-foreground mb-1">{label}</p>
                                <p className="text-foreground font-semibold text-sm capitalize">{value}</p>
                              </div>
                            ))}
                          </div>
                          <p className="text-xs text-muted-foreground">
                            Submitted: {new Date(sub.submitted_at).toLocaleString("en-IN")}
                          </p>

                          {/* Answers grouped by video */}
                          <div className="space-y-4">
                            <p className="text-xs font-bold text-muted-foreground uppercase tracking-wider">Answers</p>
                            {videos.map((video) => {
                              const videoQs = questions.filter((q) => q.video_id === video.id);
                              const videoResps = subResponses.filter((r) => videoQs.some((q) => q.id === r.question_id));
                              if (videoResps.length === 0) return null;
                              return (
                                <div key={video.id} className="space-y-3">
                                  <p className="text-xs font-bold text-primary uppercase tracking-wide">{video.title}</p>
                                  {videoQs.map((q, qi) => {
                                    const resp = subResponses.find((r) => r.question_id === q.id);
                                    if (!resp) return null;
                                    return (
                                      <div key={q.id} className="bg-card border border-border/60 rounded-xl p-4">
                                        <p className="text-sm font-semibold text-foreground mb-2 flex items-start gap-2">
                                          <span className="flex-shrink-0 mt-0.5 w-5 h-5 rounded bg-primary/15 border border-primary/25 text-primary text-[10px] font-bold flex items-center justify-center">Q{qi + 1}</span>
                                          {q.question_text}
                                        </p>
                                        <div className="bg-background rounded-lg p-3 border border-border/40">
                                          <p className="text-foreground text-sm leading-relaxed whitespace-pre-wrap">{resp.answer_text}</p>
                                        </div>
                                      </div>
                                    );
                                  })}
                                </div>
                              );
                            })}
                            {subResponses.length === 0 && (
                              <p className="text-muted-foreground text-sm italic">No answers recorded.</p>
                            )}
                          </div>
                        </div>
                      )}
                    </div>
                  );
                })}
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

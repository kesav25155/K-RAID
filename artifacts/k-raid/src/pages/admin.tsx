import { useState, useEffect, useRef } from "react";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";

type QuestionItem = { question_text: string; order: number };
type Video = { id: number; title: string; order: number; questions: QuestionItem[]; url?: string };
type Submission = { id: number; name: string; district: string; state: string; designation: string; submitted_at: string };
type Response = { id: number; submission_id: number; video_id: number; question_index: number; question_text: string; answer_text: string };

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
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>;
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
function IconMessageSquare() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>;
}
function IconEye() {
  return <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>;
}
function IconEdit() {
  return <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>;
}
function IconCheck() {
  return <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round"><polyline points="20 6 9 17 4 12"/></svg>;
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
          <img src="/logo.png" alt="K-RAID" className="w-16 h-16 rounded-full object-cover mx-auto mb-4 glow-primary-sm" style={{border: "2px solid hsl(28 65% 48% / 0.5)"}} />
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
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [responses, setResponses] = useState<Response[]>([]);
  const [loading, setLoading] = useState(false);

  // Add video form
  const [newVideoTitle, setNewVideoTitle] = useState("");
  const [q1Text, setQ1Text] = useState("");
  const [q2Text, setQ2Text] = useState("");
  const [videoFile, setVideoFile] = useState<File | null>(null);
  const [uploading, setUploading] = useState(false);
  const [uploadProgress, setUploadProgress] = useState(0);
  const [showAddVideo, setShowAddVideo] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  // Edit questions inline
  const [editingVideoId, setEditingVideoId] = useState<number | null>(null);
  const [editQ1, setEditQ1] = useState("");
  const [editQ2, setEditQ2] = useState("");
  const [savingEdit, setSavingEdit] = useState(false);

  const [expandedSub, setExpandedSub] = useState<number | null>(null);
  const [expandedVideo, setExpandedVideo] = useState<number | null>(null);
  const [previewSrcs, setPreviewSrcs] = useState<Record<number, string>>({});
  const [loadingPreview, setLoadingPreview] = useState<Record<number, boolean>>({});

  useEffect(() => { if (authed) fetchAll(); }, [authed]);

  async function fetchAll() {
    setLoading(true);
    const [v, s, r] = await Promise.all([
      supabase.from("videos").select("id,title,order,questions,url").order("order"),
      supabase.from("submissions").select("*").order("submitted_at", { ascending: false }),
      supabase.from("responses").select("*"),
    ]);
    setVideos((v.data || []).map((row) => ({ ...row, questions: Array.isArray(row.questions) ? row.questions : [] })));
    setSubmissions(s.data || []);
    setResponses(r.data || []);
    setLoading(false);
  }

  async function loadPreview(videoId: number) {
    if (previewSrcs[videoId] || loadingPreview[videoId]) return;
    setLoadingPreview((prev) => ({ ...prev, [videoId]: true }));
    const { data } = await supabase.from("videos").select("url").eq("id", videoId).single();
    if (data?.url) setPreviewSrcs((prev) => ({ ...prev, [videoId]: data.url }));
    setLoadingPreview((prev) => ({ ...prev, [videoId]: false }));
  }

  async function addVideo(e: React.FormEvent) {
    e.preventDefault();
    if (!newVideoTitle.trim()) {
      toast({ title: "Missing title", description: "Please provide a video title.", variant: "destructive" });
      return;
    }
    if (!q1Text.trim() || !q2Text.trim()) {
      toast({ title: "Missing questions", description: "Both questions are required.", variant: "destructive" });
      return;
    }
    if (!videoFile) {
      toast({ title: "No video selected", description: "Please summon a video file.", variant: "destructive" });
      return;
    }
    setUploading(true);
    setUploadProgress(10);

    // Ensure the storage bucket exists
    await supabase.storage.createBucket("videos", { public: true }).catch(() => {});

    // Upload file to Supabase Storage
    const ext = videoFile.name.split(".").pop() || "mp4";
    const fileName = `${Date.now()}_${Math.random().toString(36).slice(2)}.${ext}`;
    const { error: uploadErr } = await supabase.storage
      .from("videos")
      .upload(fileName, videoFile, { cacheControl: "3600", upsert: false });

    if (uploadErr) {
      setUploading(false);
      setUploadProgress(0);
      toast({ title: "Upload Failed", description: uploadErr.message, variant: "destructive" });
      return;
    }
    setUploadProgress(80);

    // Get the public URL
    const { data: urlData } = supabase.storage.from("videos").getPublicUrl(fileName);
    const publicUrl = urlData.publicUrl;

    setUploadProgress(90);

    const questionsJson: QuestionItem[] = [
      { question_text: q1Text.trim(), order: 1 },
      { question_text: q2Text.trim(), order: 2 },
    ];

    const maxOrder = videos.reduce((m, v) => Math.max(m, v.order), 0);
    const { error: insertErr } = await supabase.from("videos").insert([{
      title: newVideoTitle.trim(),
      url: publicUrl,
      order: maxOrder + 1,
      questions: questionsJson,
    }]);

    setUploading(false);
    setUploadProgress(0);

    if (insertErr) {
      // Rollback storage upload if DB insert fails
      await supabase.storage.from("videos").remove([fileName]);
      toast({ title: "Database Error", description: insertErr.message, variant: "destructive" });
      return;
    }

    setNewVideoTitle(""); setQ1Text(""); setQ2Text(""); setVideoFile(null);
    if (fileInputRef.current) fileInputRef.current.value = "";
    setShowAddVideo(false);
    toast({ title: "Video saved", description: `"${newVideoTitle.trim()}" uploaded and saved successfully.` });
    fetchAll();
  }

  async function deleteVideo(id: number) {
    if (!confirm("Delete this video and all its responses?")) return;
    // Get the URL first so we can remove from storage too
    const video = videos.find((v) => v.id === id);
    await supabase.from("videos").delete().eq("id", id);
    if (video) {
      // Extract the filename from the storage URL and delete it
      try {
        const url = new URL(video.url || "");
        const parts = url.pathname.split("/videos/");
        if (parts[1]) await supabase.storage.from("videos").remove([parts[1]]);
      } catch {}
    }
    toast({ title: "Video deleted" });
    fetchAll();
  }

  function startEditQuestions(video: Video) {
    setEditingVideoId(video.id);
    setEditQ1(video.questions[0]?.question_text || "");
    setEditQ2(video.questions[1]?.question_text || "");
  }

  async function saveEditQuestions(videoId: number) {
    if (!editQ1.trim() || !editQ2.trim()) {
      toast({ title: "Both questions required", variant: "destructive" }); return;
    }
    setSavingEdit(true);
    const updated: QuestionItem[] = [
      { question_text: editQ1.trim(), order: 1 },
      { question_text: editQ2.trim(), order: 2 },
    ];
    const { error } = await supabase.from("videos").update({ questions: updated }).eq("id", videoId);
    setSavingEdit(false);
    if (error) { toast({ title: "Error", description: error.message, variant: "destructive" }); return; }
    setEditingVideoId(null);
    toast({ title: "Questions updated" });
    fetchAll();
  }

  function exportCSV() {
    const rows: string[][] = [];
    rows.push(["Submission ID", "Name", "District", "State", "Designation", "Submitted At", "Video", "Q#", "Question", "Answer"]);
    for (const sub of submissions) {
      const subResponses = responses.filter((r) => r.submission_id === sub.id);
      if (subResponses.length === 0) {
        rows.push([String(sub.id), sub.name, sub.district, sub.state, sub.designation, sub.submitted_at, "", "", "", ""]);
      } else {
        for (const resp of subResponses) {
          const video = videos.find((v) => v.id === resp.video_id);
          rows.push([
            String(sub.id), sub.name, sub.district, sub.state, sub.designation, sub.submitted_at,
            video?.title || "", String(resp.question_index + 1), resp.question_text || "", resp.answer_text,
          ]);
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

  const totalQuestions = videos.reduce((s, v) => s + (v.questions?.length || 0), 0);

  const statCards = [
    { label: "Videos", value: videos.length, icon: <IconFilm />, color: "text-primary" },
    { label: "Questions", value: totalQuestions, icon: <IconMessageSquare />, color: "text-cyan-400" },
    { label: "Submissions", value: submissions.length, icon: <IconUsers />, color: "text-emerald-400" },
    { label: "Responses", value: responses.length, icon: <IconMessageSquare />, color: "text-violet-400" },
  ];

  return (
    <div className="min-h-screen bg-background text-foreground">
      <div className="fixed top-0 left-1/2 -translate-x-1/2 w-[500px] h-[180px] bg-primary/6 rounded-full blur-3xl pointer-events-none" />

      {/* Header */}
      <header className="site-header relative">
        <div className="max-w-6xl mx-auto px-4 h-16 flex items-center justify-between relative z-10">
          <div className="flex items-center gap-3">
            <img src="/logo.png" alt="K-RAID" className="header-logo-img" />
            <div className="flex items-center gap-2.5">
              <span className="header-logo-text">K-RAID</span>
              <span className="header-admin-badge">Admin</span>
            </div>
          </div>
          <div className="flex items-center gap-2">
            <a href="/" className="header-nav-btn">
              <IconEye /> View Site
            </a>
            <button onClick={() => setAuthed(false)} className="header-nav-btn danger">
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
          {(["videos", "responses"] as const).map((t) => (
            <button key={t} onClick={() => setTab(t)}
              className={`px-5 py-2 rounded-lg text-sm font-semibold transition-all capitalize ${
                tab === t ? "bg-primary text-white glow-primary-sm" : "bg-card border border-card-border text-muted-foreground hover:text-foreground"
              }`}
            >
              {t}
            </button>
          ))}
        </div>

        {/* ── Videos Tab ── */}
        {tab === "videos" && (
          <div className="space-y-4">
            <div className="flex items-center justify-between">
              <h2 className="text-lg font-bold text-foreground">
                Videos <span className="text-muted-foreground font-normal text-sm ml-1">({videos.length})</span>
              </h2>
              <button
                onClick={() => setShowAddVideo(!showAddVideo)}
                className="flex items-center gap-2 px-4 py-2 bg-primary text-white font-semibold text-sm rounded-lg hover:bg-primary/90 transition-colors glow-primary-sm"
              >
                <IconPlus /> Add Video
              </button>
            </div>

            {/* Add Video Form */}
            {showAddVideo && (
              <div className="bg-card border border-primary/30 rounded-xl p-5 shadow-lg glow-primary-sm">
                <div className="flex items-center justify-between mb-4">
                  <h3 className="font-bold text-foreground text-sm">Upload New Video</h3>
                  <button type="button" onClick={() => { setShowAddVideo(false); setVideoFile(null); setNewVideoTitle(""); setQ1Text(""); setQ2Text(""); }}
                    className="text-muted-foreground hover:text-foreground">
                    <IconX />
                  </button>
                </div>
                <form onSubmit={addVideo} className="space-y-4">
                  {/* Title */}
                  <div>
                    <label className="block text-sm font-semibold text-foreground mb-1.5">Video Title <span className="text-destructive">*</span></label>
                    <input
                      value={newVideoTitle} onChange={(e) => setNewVideoTitle(e.target.value)}
                      placeholder="e.g. Video 1: Kabaddi Raid Technique"
                      className="w-full px-3 py-2.5 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 text-sm transition-all"
                    />
                  </div>

                  {/* Video File */}
                  <div>
                    <label className="block text-sm font-semibold text-foreground mb-1.5">Video File <span className="text-destructive">*</span></label>
                    <div className="flex items-center gap-3 flex-wrap">
                      <button
                        type="button"
                        onClick={() => fileInputRef.current?.click()}
                        className="flex items-center gap-2 px-5 py-2.5 bg-primary/10 border border-primary/30 text-primary font-semibold text-sm rounded-lg hover:bg-primary/20 hover:border-primary/60 transition-all"
                      >
                        <IconFilm />
                        Summon Video
                      </button>
                      {videoFile ? (
                        <div className="flex items-center gap-2 flex-1 min-w-0">
                          <span className="text-foreground text-sm font-medium truncate">{videoFile.name}</span>
                          <span className="text-muted-foreground text-xs flex-shrink-0">{(videoFile.size / (1024 * 1024)).toFixed(1)} MB</span>
                          <button type="button" onClick={() => { setVideoFile(null); if (fileInputRef.current) fileInputRef.current.value = ""; }}
                            className="text-muted-foreground hover:text-destructive flex-shrink-0 transition-colors">
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

                  {/* Question 1 */}
                  <div>
                    <label className="block text-sm font-semibold text-foreground mb-1.5 flex items-center gap-2">
                      <span className="w-5 h-5 rounded bg-primary/20 border border-primary/30 text-primary text-[10px] font-bold flex items-center justify-center">Q1</span>
                      Question 1 <span className="text-destructive">*</span>
                    </label>
                    <input
                      value={q1Text} onChange={(e) => setQ1Text(e.target.value)}
                      placeholder="Enter the first research question..."
                      className="w-full px-3 py-2.5 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 text-sm transition-all"
                    />
                  </div>

                  {/* Question 2 */}
                  <div>
                    <label className="block text-sm font-semibold text-foreground mb-1.5 flex items-center gap-2">
                      <span className="w-5 h-5 rounded bg-primary/20 border border-primary/30 text-primary text-[10px] font-bold flex items-center justify-center">Q2</span>
                      Question 2 <span className="text-destructive">*</span>
                    </label>
                    <input
                      value={q2Text} onChange={(e) => setQ2Text(e.target.value)}
                      placeholder="Enter the second research question..."
                      className="w-full px-3 py-2.5 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-primary/50 text-sm transition-all"
                    />
                  </div>

                  {/* Upload progress */}
                  {uploading && (
                    <div className="space-y-1.5">
                      <div className="flex items-center justify-between text-xs text-muted-foreground">
                        <span>{uploadProgress < 80 ? "Uploading to storage..." : "Saving to database..."}</span>
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
                      {uploading ? <><IconLoader /> Processing...</> : <><IconUpload /> Save to Database</>}
                    </button>
                    <button type="button" onClick={() => { setShowAddVideo(false); setVideoFile(null); setNewVideoTitle(""); setQ1Text(""); setQ2Text(""); }}
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
                  const isExp = expandedVideo === video.id;
                  const isEditing = editingVideoId === video.id;
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
                            <p className="text-xs text-muted-foreground flex items-center gap-1">
                              <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 inline-block"></span>
                              Stored in database
                            </p>
                          </div>
                        </div>
                        <div className="flex items-center gap-3 flex-shrink-0 ml-3">
                          <span className="text-xs text-muted-foreground bg-muted px-2 py-1 rounded-full hidden sm:block">
                            {video.questions?.length || 0} questions
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
                          <div className="rounded-xl overflow-hidden border border-border/60 bg-black aspect-video max-h-48 relative">
                            {previewSrcs[video.id] ? (
                              <video src={previewSrcs[video.id]} controls autoPlay className="w-full h-full object-contain" />
                            ) : (
                              <button
                                type="button"
                                onClick={() => loadPreview(video.id)}
                                disabled={loadingPreview[video.id]}
                                className="absolute inset-0 w-full h-full flex flex-col items-center justify-center gap-2 hover:bg-white/5 transition-colors"
                              >
                                {loadingPreview[video.id] ? (
                                  <><div className="w-8 h-8 border-2 border-primary border-t-transparent rounded-full animate-spin" /><span className="text-muted-foreground text-xs">Loading...</span></>
                                ) : (
                                  <><svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor" className="text-primary"><polygon points="5 3 19 12 5 21 5 3"/></svg><span className="text-muted-foreground text-xs">Preview video</span></>
                                )}
                              </button>
                            )}
                          </div>

                          {/* Questions */}
                          <div className="space-y-3">
                            <div className="flex items-center justify-between">
                              <h4 className="text-xs font-bold text-muted-foreground uppercase tracking-wider">Questions (JSONB)</h4>
                              {!isEditing ? (
                                <button
                                  onClick={() => startEditQuestions(video)}
                                  className="flex items-center gap-1.5 text-xs text-primary hover:text-primary/80 px-2.5 py-1 rounded-lg border border-primary/30 hover:border-primary/60 transition-colors"
                                >
                                  <IconEdit /> Edit
                                </button>
                              ) : (
                                <div className="flex gap-2">
                                  <button
                                    onClick={() => saveEditQuestions(video.id)}
                                    disabled={savingEdit}
                                    className="flex items-center gap-1.5 text-xs text-emerald-400 hover:text-emerald-300 px-2.5 py-1 rounded-lg border border-emerald-500/30 hover:border-emerald-500/60 transition-colors"
                                  >
                                    {savingEdit ? <IconLoader /> : <IconCheck />} Save
                                  </button>
                                  <button
                                    onClick={() => setEditingVideoId(null)}
                                    className="text-xs text-muted-foreground hover:text-foreground px-2.5 py-1 rounded-lg border border-border transition-colors"
                                  >
                                    Cancel
                                  </button>
                                </div>
                              )}
                            </div>

                            {isEditing ? (
                              <div className="space-y-3">
                                {[{ val: editQ1, set: setEditQ1, label: "Q1" }, { val: editQ2, set: setEditQ2, label: "Q2" }].map(({ val, set, label }) => (
                                  <div key={label} className="flex items-start gap-2">
                                    <span className="mt-2.5 flex-shrink-0 w-5 h-5 rounded bg-primary/15 border border-primary/25 text-primary text-[10px] font-bold flex items-center justify-center">{label}</span>
                                    <input
                                      value={val} onChange={(e) => set(e.target.value)}
                                      className="flex-1 px-3 py-2 bg-background border border-input rounded-lg text-foreground text-sm focus:outline-none focus:ring-2 focus:ring-primary/50 transition-all"
                                    />
                                  </div>
                                ))}
                              </div>
                            ) : (
                              <div className="space-y-2">
                                {(video.questions || []).map((q, qi) => (
                                  <div key={qi} className="flex items-start gap-2 bg-card rounded-lg px-3 py-2.5 border border-border/60">
                                    <span className="mt-0.5 flex-shrink-0 w-5 h-5 rounded bg-primary/15 border border-primary/25 text-primary text-[10px] font-bold flex items-center justify-center">Q{qi + 1}</span>
                                    <span className="text-foreground text-sm leading-relaxed">{q.question_text}</span>
                                  </div>
                                ))}
                                {(!video.questions || video.questions.length === 0) && (
                                  <p className="text-muted-foreground text-sm italic">No questions stored.</p>
                                )}
                              </div>
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

                          <div className="space-y-4">
                            <p className="text-xs font-bold text-muted-foreground uppercase tracking-wider">Answers</p>
                            {videos.map((video) => {
                              const videoResps = subResponses.filter((r) => r.video_id === video.id);
                              if (videoResps.length === 0) return null;
                              return (
                                <div key={video.id} className="space-y-3">
                                  <p className="text-xs font-bold text-primary uppercase tracking-wide">{video.title}</p>
                                  {videoResps.sort((a, b) => a.question_index - b.question_index).map((resp) => (
                                    <div key={resp.id} className="bg-card border border-border/60 rounded-xl p-4">
                                      <p className="text-sm font-semibold text-foreground mb-2 flex items-start gap-2">
                                        <span className="flex-shrink-0 mt-0.5 w-5 h-5 rounded bg-primary/15 border border-primary/25 text-primary text-[10px] font-bold flex items-center justify-center">
                                          Q{resp.question_index + 1}
                                        </span>
                                        {resp.question_text}
                                      </p>
                                      <div className="bg-background rounded-lg p-3 border border-border/40">
                                        <p className="text-foreground text-sm leading-relaxed whitespace-pre-wrap">{resp.answer_text}</p>
                                      </div>
                                    </div>
                                  ))}
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

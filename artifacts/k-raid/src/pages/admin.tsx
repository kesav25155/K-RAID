import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";

type Video = { id: number; title: string; url: string; order: number };
type Question = { id: number; video_id: number; question_text: string; order: number };
type Submission = { id: number; name: string; district: string; state: string; designation: string; submitted_at: string };
type Response = { id: number; submission_id: number; question_id: number; answer_text: string };

const ADMIN_PASSWORD = "kraid@2025";

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
      <div className="w-full max-w-sm">
        <div className="text-center mb-8">
          <div className="w-16 h-16 rounded-2xl bg-primary flex items-center justify-center font-black text-primary-foreground text-3xl mx-auto mb-4">K</div>
          <h1 className="text-2xl font-black text-foreground">Admin Panel</h1>
          <p className="text-muted-foreground text-sm mt-1">K-RAID Management Portal</p>
        </div>
        <form onSubmit={attempt} className="bg-card border border-card-border rounded-2xl p-6 shadow-lg space-y-4">
          <div>
            <label className="block text-sm font-semibold text-foreground mb-2">Password</label>
            <input
              type="password" value={pw} onChange={(e) => { setPw(e.target.value); setErr(false); }}
              placeholder="Enter admin password"
              className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring transition"
            />
            {err && <p className="text-destructive text-sm mt-1">Incorrect password.</p>}
          </div>
          <button type="submit" className="w-full py-3 bg-primary text-primary-foreground font-bold rounded-xl hover:opacity-90 transition-opacity">
            Login
          </button>
        </form>
      </div>
    </div>
  );
}

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
  const [newVideoUrl, setNewVideoUrl] = useState("");
  const [addingVideo, setAddingVideo] = useState(false);
  const [showAddVideo, setShowAddVideo] = useState(false);

  const [newQText, setNewQText] = useState("");
  const [newQVideoId, setNewQVideoId] = useState<number | null>(null);
  const [addingQ, setAddingQ] = useState(false);

  const [expandedSub, setExpandedSub] = useState<number | null>(null);
  const [expandedVideo, setExpandedVideo] = useState<number | null>(null);

  useEffect(() => {
    if (authed) fetchAll();
  }, [authed]);

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
    if (!newVideoTitle.trim() || !newVideoUrl.trim()) return;
    setAddingVideo(true);
    const maxOrder = videos.reduce((m, v) => Math.max(m, v.order), 0);
    const { error } = await supabase.from("videos").insert([{ title: newVideoTitle.trim(), url: newVideoUrl.trim(), order: maxOrder + 1 }]);
    setAddingVideo(false);
    if (error) { toast({ title: "Error", description: error.message, variant: "destructive" }); return; }
    setNewVideoTitle(""); setNewVideoUrl(""); setShowAddVideo(false);
    toast({ title: "Video added!" });
    fetchAll();
  }

  async function deleteVideo(id: number) {
    if (!confirm("Delete this video and all its questions?")) return;
    await supabase.from("videos").delete().eq("id", id);
    toast({ title: "Video deleted" });
    fetchAll();
  }

  async function addQuestion(e: React.FormEvent) {
    e.preventDefault();
    if (!newQText.trim() || !newQVideoId) return;
    setAddingQ(true);
    const videoQs = questions.filter((q) => q.video_id === newQVideoId);
    const maxOrder = videoQs.reduce((m, q) => Math.max(m, q.order), 0);
    const { error } = await supabase.from("questions").insert([{ video_id: newQVideoId, question_text: newQText.trim(), order: maxOrder + 1 }]);
    setAddingQ(false);
    if (error) { toast({ title: "Error", description: error.message, variant: "destructive" }); return; }
    setNewQText("");
    toast({ title: "Question added!" });
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
          const question = questions.find((q) => q.id === resp.question_id);
          rows.push([
            String(sub.id), sub.name, sub.district, sub.state, sub.designation, sub.submitted_at,
            String(resp.question_id), question?.question_text || "", resp.answer_text,
          ]);
        }
      }
    }

    const csv = rows.map((row) => row.map((cell) => `"${String(cell).replace(/"/g, '""')}"`).join(",")).join("\n");
    const blob = new Blob([csv], { type: "text/csv" });
    const url = URL.createObjectURL(blob);
    const a = document.createElement("a");
    a.href = url; a.download = "k-raid-responses.csv"; a.click();
    URL.revokeObjectURL(url);
  }

  if (!authed) return <LoginScreen onLogin={() => setAuthed(true)} />;

  return (
    <div className="min-h-screen bg-background text-foreground">
      {/* Header */}
      <header className="sticky top-0 z-50 bg-background/90 backdrop-blur-md border-b border-border">
        <div className="max-w-6xl mx-auto px-4 py-4 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-primary flex items-center justify-center font-black text-primary-foreground text-lg">K</div>
            <div>
              <h1 className="text-xl font-black tracking-wider text-foreground">K-RAID <span className="text-primary text-sm font-semibold">Admin</span></h1>
              <p className="text-xs text-muted-foreground leading-none">Management Portal</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <a href="/" className="text-xs text-muted-foreground hover:text-primary transition-colors px-3 py-1.5 border border-border rounded-lg hover:border-primary/50">
              View Site
            </a>
            <button onClick={() => setAuthed(false)} className="text-xs text-muted-foreground hover:text-destructive transition-colors px-3 py-1.5 border border-border rounded-lg hover:border-destructive/50">
              Logout
            </button>
          </div>
        </div>
      </header>

      <div className="max-w-6xl mx-auto px-4 py-8">
        {/* Stats */}
        <div className="grid grid-cols-2 md:grid-cols-4 gap-4 mb-8">
          {[
            { label: "Videos", value: videos.length, icon: "🎬" },
            { label: "Questions", value: questions.length, icon: "❓" },
            { label: "Submissions", value: submissions.length, icon: "📋" },
            { label: "Responses", value: responses.length, icon: "💬" },
          ].map((stat) => (
            <div key={stat.label} className="bg-card border border-card-border rounded-xl p-4 shadow-sm">
              <div className="text-2xl mb-1">{stat.icon}</div>
              <div className="text-3xl font-black text-foreground">{stat.value}</div>
              <div className="text-muted-foreground text-sm">{stat.label}</div>
            </div>
          ))}
        </div>

        {/* Tabs */}
        <div className="flex gap-2 mb-6">
          {(["videos", "responses"] as const).map((t) => (
            <button
              key={t} onClick={() => setTab(t)}
              className={`px-5 py-2 rounded-lg font-semibold text-sm capitalize transition-all ${
                tab === t ? "bg-primary text-primary-foreground shadow-md" : "bg-card border border-card-border text-muted-foreground hover:text-foreground hover:border-ring"
              }`}
            >
              {t === "videos" ? "Videos & Questions" : "Submissions & Responses"}
            </button>
          ))}
        </div>

        {/* Videos Tab */}
        {tab === "videos" && (
          <div className="space-y-6">
            <div className="flex items-center justify-between">
              <h2 className="text-xl font-bold text-foreground">Manage Videos</h2>
              <button
                onClick={() => setShowAddVideo(!showAddVideo)}
                className="flex items-center gap-2 px-4 py-2 bg-primary text-primary-foreground font-semibold text-sm rounded-lg hover:opacity-90 transition-opacity"
              >
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 4v16m8-8H4" />
                </svg>
                Add Video
              </button>
            </div>

            {/* Add Video Form */}
            {showAddVideo && (
              <form onSubmit={addVideo} className="bg-card border border-primary/30 rounded-xl p-5 space-y-4 shadow-md">
                <h3 className="font-semibold text-foreground text-sm uppercase tracking-wide text-primary">New Video</h3>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                  <div>
                    <label className="block text-sm font-semibold text-foreground mb-1.5">Title <span className="text-destructive">*</span></label>
                    <input
                      value={newVideoTitle} onChange={(e) => setNewVideoTitle(e.target.value)}
                      placeholder="e.g. Video 1: Introduction to Kabaddi"
                      className="w-full px-3 py-2.5 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring text-sm"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-foreground mb-1.5">Video URL <span className="text-destructive">*</span></label>
                    <input
                      value={newVideoUrl} onChange={(e) => setNewVideoUrl(e.target.value)}
                      placeholder="https://example.com/video.mp4"
                      className="w-full px-3 py-2.5 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring text-sm"
                    />
                  </div>
                </div>
                <div className="flex gap-3">
                  <button type="submit" disabled={addingVideo} className="px-5 py-2 bg-primary text-primary-foreground font-semibold text-sm rounded-lg hover:opacity-90 disabled:opacity-50">
                    {addingVideo ? "Adding..." : "Add Video"}
                  </button>
                  <button type="button" onClick={() => setShowAddVideo(false)} className="px-5 py-2 bg-muted text-muted-foreground font-semibold text-sm rounded-lg hover:bg-muted/80">
                    Cancel
                  </button>
                </div>
              </form>
            )}

            {/* Video List */}
            {loading ? (
              <div className="text-center py-12"><div className="w-8 h-8 border-4 border-primary border-t-transparent rounded-full animate-spin mx-auto"></div></div>
            ) : videos.length === 0 ? (
              <div className="text-center py-12 bg-card border border-card-border rounded-xl text-muted-foreground">No videos yet. Add one above.</div>
            ) : (
              <div className="space-y-4">
                {videos.map((video) => {
                  const videoQs = questions.filter((q) => q.video_id === video.id);
                  const isExpanded = expandedVideo === video.id;
                  return (
                    <div key={video.id} className="bg-card border border-card-border rounded-xl overflow-hidden shadow-sm">
                      <div
                        className="p-4 flex items-center justify-between cursor-pointer hover:bg-muted/30 transition-colors"
                        onClick={() => setExpandedVideo(isExpanded ? null : video.id)}
                      >
                        <div className="flex items-center gap-3 min-w-0">
                          <div className="w-8 h-8 rounded-lg bg-primary/20 border border-primary/30 flex items-center justify-center text-primary text-xs font-bold flex-shrink-0">
                            {video.order}
                          </div>
                          <div className="min-w-0">
                            <p className="font-semibold text-foreground truncate">{video.title}</p>
                            <p className="text-xs text-muted-foreground truncate">{video.url}</p>
                          </div>
                        </div>
                        <div className="flex items-center gap-3 flex-shrink-0">
                          <span className="text-xs text-muted-foreground bg-muted px-2 py-1 rounded-full">{videoQs.length} questions</span>
                          <button
                            onClick={(e) => { e.stopPropagation(); deleteVideo(video.id); }}
                            className="text-destructive hover:text-destructive/80 transition-colors p-1"
                          >
                            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                            </svg>
                          </button>
                          <svg className={`w-4 h-4 text-muted-foreground transition-transform ${isExpanded ? "rotate-180" : ""}`} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                          </svg>
                        </div>
                      </div>

                      {isExpanded && (
                        <div className="border-t border-border p-4 space-y-3">
                          <h4 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">Questions</h4>
                          {videoQs.length === 0 ? (
                            <p className="text-muted-foreground text-sm italic">No questions yet.</p>
                          ) : (
                            <div className="space-y-2">
                              {videoQs.map((q, qi) => (
                                <div key={q.id} className="flex items-start justify-between gap-3 bg-background rounded-lg px-3 py-2.5 border border-border">
                                  <div className="flex items-start gap-2 min-w-0">
                                    <span className="text-primary text-xs font-bold mt-0.5 flex-shrink-0">Q{qi + 1}</span>
                                    <span className="text-foreground text-sm">{q.question_text}</span>
                                  </div>
                                  <button onClick={() => deleteQuestion(q.id)} className="text-destructive/70 hover:text-destructive flex-shrink-0 p-1">
                                    <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                                    </svg>
                                  </button>
                                </div>
                              ))}
                            </div>
                          )}

                          {/* Add Question */}
                          <form onSubmit={(e) => { setNewQVideoId(video.id); addQuestion(e); }} className="flex gap-2 mt-2">
                            <input
                              value={newQVideoId === video.id ? newQText : ""}
                              onChange={(e) => { setNewQVideoId(video.id); setNewQText(e.target.value); }}
                              placeholder="Type a new question..."
                              className="flex-1 px-3 py-2 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring text-sm"
                            />
                            <button
                              type="submit" disabled={addingQ}
                              className="px-4 py-2 bg-primary text-primary-foreground font-semibold text-sm rounded-lg hover:opacity-90 disabled:opacity-50 flex-shrink-0"
                            >
                              {addingQ ? "..." : "Add Q"}
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

        {/* Responses Tab */}
        {tab === "responses" && (
          <div className="space-y-6">
            <div className="flex items-center justify-between">
              <h2 className="text-xl font-bold text-foreground">
                Submissions <span className="text-muted-foreground font-normal text-base">({submissions.length})</span>
              </h2>
              <button
                onClick={exportCSV}
                className="flex items-center gap-2 px-4 py-2 bg-green-600 text-white font-semibold text-sm rounded-lg hover:bg-green-500 transition-colors shadow-md"
              >
                <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4" />
                </svg>
                Export CSV
              </button>
            </div>

            {loading ? (
              <div className="text-center py-12"><div className="w-8 h-8 border-4 border-primary border-t-transparent rounded-full animate-spin mx-auto"></div></div>
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
                    <div key={sub.id} className="bg-card border border-card-border rounded-xl overflow-hidden shadow-sm">
                      <div
                        className="p-4 flex items-center justify-between cursor-pointer hover:bg-muted/20 transition-colors"
                        onClick={() => setExpandedSub(isOpen ? null : sub.id)}
                      >
                        <div className="flex items-center gap-3 min-w-0">
                          <div className="w-10 h-10 rounded-full bg-primary/20 border border-primary/30 flex items-center justify-center text-primary font-bold text-sm flex-shrink-0">
                            {sub.name.charAt(0).toUpperCase()}
                          </div>
                          <div className="min-w-0">
                            <p className="font-semibold text-foreground">{sub.name}</p>
                            <p className="text-xs text-muted-foreground">{sub.district}, {sub.state}</p>
                          </div>
                        </div>
                        <div className="flex items-center gap-3 flex-shrink-0">
                          <span className={`text-xs font-semibold px-2.5 py-1 rounded-full capitalize ${
                            sub.designation === "coach"
                              ? "bg-violet-500/20 text-violet-400 border border-violet-500/30"
                              : "bg-primary/20 text-primary border border-primary/30"
                          }`}>
                            {sub.designation}
                          </span>
                          <span className="text-xs text-muted-foreground hidden md:block">
                            {new Date(sub.submitted_at).toLocaleDateString("en-IN", { day: "numeric", month: "short", year: "numeric" })}
                          </span>
                          <span className="text-xs text-muted-foreground bg-muted px-2 py-1 rounded-full">{subResponses.length} answers</span>
                          <svg className={`w-4 h-4 text-muted-foreground transition-transform ${isOpen ? "rotate-180" : ""}`} fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
                          </svg>
                        </div>
                      </div>

                      {isOpen && (
                        <div className="border-t border-border p-5 space-y-5">
                          {/* Person Details */}
                          <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
                            {[
                              { label: "Full Name", value: sub.name },
                              { label: "District", value: sub.district },
                              { label: "State", value: sub.state },
                              { label: "Designation", value: sub.designation },
                            ].map((detail) => (
                              <div key={detail.label} className="bg-background border border-border rounded-lg p-3">
                                <p className="text-xs text-muted-foreground mb-1">{detail.label}</p>
                                <p className="text-foreground font-semibold text-sm capitalize">{detail.value}</p>
                              </div>
                            ))}
                          </div>
                          <div className="text-xs text-muted-foreground">
                            Submitted: {new Date(sub.submitted_at).toLocaleString("en-IN")}
                          </div>

                          {/* Responses grouped by video */}
                          <div className="space-y-4">
                            <h4 className="text-sm font-semibold text-muted-foreground uppercase tracking-wide">Answers</h4>
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
                                      <div key={q.id} className="bg-background border border-border rounded-lg p-4">
                                        <p className="text-sm font-semibold text-foreground mb-2">
                                          <span className="text-primary mr-1">Q{qi + 1}.</span>
                                          {q.question_text}
                                        </p>
                                        <div className="bg-muted/40 rounded-lg p-3">
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

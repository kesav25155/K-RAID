import { useState } from "react";
import { supabase } from "@/lib/supabase";
import { useToast } from "@/hooks/use-toast";

const VIDEOS = [
  {
    id: 1,
    url: "https://www.w3schools.com/html/mov_bbb.mp4",
    title: "Video 1: Introduction to Kabaddi",
    questions: [
      "Describe your experience with kabaddi and how long you have been involved in the sport.",
      "What do you think are the most important physical qualities required for kabaddi and why?",
    ],
  },
  {
    id: 2,
    url: "https://www.w3schools.com/html/mov_bbb.mp4",
    title: "Video 2: Raiding Techniques",
    questions: [
      "After watching this video, explain the raiding techniques shown and how you would apply them in a real match.",
      "What strategies would you use to improve your raiding skills based on what you observed?",
    ],
  },
  {
    id: 3,
    url: "https://www.w3schools.com/html/mov_bbb.mp4",
    title: "Video 3: Defensive Formations",
    questions: [
      "Describe the defensive formations demonstrated in the video and their effectiveness.",
      "How would you train your team or yourself to better defend against strong raiders?",
    ],
  },
  {
    id: 4,
    url: "https://www.w3schools.com/html/mov_bbb.mp4",
    title: "Video 4: Team Coordination",
    questions: [
      "What aspects of team coordination did you notice in the video and why are they crucial in kabaddi?",
      "Share your experience (as player or coach) in building effective team communication during a match.",
    ],
  },
  {
    id: 5,
    url: "https://www.w3schools.com/html/mov_bbb.mp4",
    title: "Video 5: Match Strategy",
    questions: [
      "Analyze the overall match strategy presented in the video and discuss its strengths and weaknesses.",
      "If you were coaching this team, what changes would you suggest to improve their performance?",
    ],
  },
];

type Answers = Record<string, string>;

const INDIAN_STATES = [
  "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh",
  "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jharkhand", "Karnataka",
  "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram",
  "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu",
  "Telangana", "Tripura", "Uttar Pradesh", "Uttarakhand", "West Bengal",
  "Andaman and Nicobar Islands", "Chandigarh", "Dadra and Nagar Haveli",
  "Daman and Diu", "Delhi", "Jammu and Kashmir", "Ladakh", "Lakshadweep", "Puducherry",
];

export default function Home() {
  const { toast } = useToast();

  const [name, setName] = useState("");
  const [district, setDistrict] = useState("");
  const [state, setState] = useState("");
  const [designation, setDesignation] = useState<"player" | "coach" | "">("");
  const [answers, setAnswers] = useState<Answers>({});
  const [submitting, setSubmitting] = useState(false);
  const [submitted, setSubmitted] = useState(false);

  function setAnswer(videoId: number, questionIndex: number, value: string) {
    setAnswers((prev) => ({
      ...prev,
      [`v${videoId}_q${questionIndex + 1}`]: value,
    }));
  }

  function getAnswer(videoId: number, questionIndex: number) {
    return answers[`v${videoId}_q${questionIndex + 1}`] || "";
  }

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();

    if (!name.trim() || !district.trim() || !state || !designation) {
      toast({
        title: "Missing Information",
        description: "Please fill in all personal details before submitting.",
        variant: "destructive",
      });
      return;
    }

    for (const video of VIDEOS) {
      for (let qi = 0; qi < 2; qi++) {
        if (!getAnswer(video.id, qi).trim()) {
          toast({
            title: "Incomplete Answers",
            description: `Please answer all questions for ${video.title}.`,
            variant: "destructive",
          });
          return;
        }
      }
    }

    setSubmitting(true);

    const payload = {
      name: name.trim(),
      district: district.trim(),
      state,
      designation,
      ...answers,
      submitted_at: new Date().toISOString(),
    };

    const { error } = await supabase.from("k_raid_submissions").insert([payload]);

    setSubmitting(false);

    if (error) {
      const msg = error.code === "42P01"
        ? "Database table not found. Please contact the administrator to set up the database."
        : error.message || "Could not save your response. Please try again.";
      toast({
        title: "Submission Failed",
        description: msg,
        variant: "destructive",
      });
      return;
    }

    setSubmitted(true);
    toast({
      title: "Submitted Successfully",
      description: "Your response has been recorded. Thank you!",
    });
  }

  if (submitted) {
    return (
      <div className="min-h-screen bg-background flex items-center justify-center px-4">
        <div className="text-center max-w-md">
          <div className="w-20 h-20 rounded-full bg-primary/20 flex items-center justify-center mx-auto mb-6">
            <svg className="w-10 h-10 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M5 13l4 4L19 7" />
            </svg>
          </div>
          <h2 className="text-3xl font-bold text-foreground mb-3">Thank You!</h2>
          <p className="text-muted-foreground text-lg mb-2">Your submission has been recorded successfully.</p>
          <p className="text-muted-foreground">We appreciate your participation in K-RAID.</p>
          <button
            className="mt-8 px-6 py-3 bg-primary text-primary-foreground font-semibold rounded-lg hover:opacity-90 transition-opacity"
            onClick={() => {
              setSubmitted(false);
              setName("");
              setDistrict("");
              setState("");
              setDesignation("");
              setAnswers({});
            }}
          >
            Submit Another Response
          </button>
        </div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-background text-foreground">
      {/* Header */}
      <header className="sticky top-0 z-50 bg-background/90 backdrop-blur border-b border-border">
        <div className="max-w-5xl mx-auto px-4 py-4 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-10 h-10 rounded-lg bg-primary flex items-center justify-center font-black text-primary-foreground text-lg tracking-tight">
              K
            </div>
            <div>
              <h1 className="text-xl font-black tracking-wider text-foreground">K-RAID</h1>
              <p className="text-xs text-muted-foreground leading-none">Kabaddi Player &amp; Coach Registration</p>
            </div>
          </div>
        </div>
      </header>

      <form onSubmit={handleSubmit} className="max-w-5xl mx-auto px-4 py-10 space-y-10">
        {/* Hero */}
        <div className="text-center py-6">
          <h2 className="text-4xl font-black tracking-wide text-foreground mb-3">
            Register Your <span className="text-primary">K-RAID</span> Profile
          </h2>
          <p className="text-muted-foreground text-lg max-w-xl mx-auto">
            Watch all 5 videos, answer the questions thoroughly, and submit your details. All fields are required.
          </p>
        </div>

        {/* Personal Details */}
        <section className="bg-card border border-card-border rounded-2xl p-6 md:p-8 shadow-md">
          <h3 className="text-xl font-bold text-foreground mb-6 flex items-center gap-2">
            <span className="w-7 h-7 rounded-full bg-primary text-primary-foreground text-sm font-bold flex items-center justify-center">1</span>
            Personal Details
          </h3>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
            <div>
              <label className="block text-sm font-semibold text-foreground mb-2">Full Name <span className="text-destructive">*</span></label>
              <input
                type="text"
                required
                value={name}
                onChange={(e) => setName(e.target.value)}
                placeholder="Enter your full name"
                className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:border-ring transition"
              />
            </div>
            <div>
              <label className="block text-sm font-semibold text-foreground mb-2">District <span className="text-destructive">*</span></label>
              <input
                type="text"
                required
                value={district}
                onChange={(e) => setDistrict(e.target.value)}
                placeholder="Enter your district"
                className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:border-ring transition"
              />
            </div>
            <div>
              <label className="block text-sm font-semibold text-foreground mb-2">State <span className="text-destructive">*</span></label>
              <select
                required
                value={state}
                onChange={(e) => setState(e.target.value)}
                className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:border-ring transition"
              >
                <option value="" disabled>Select your state</option>
                {INDIAN_STATES.map((s) => (
                  <option key={s} value={s}>{s}</option>
                ))}
              </select>
            </div>
            <div>
              <label className="block text-sm font-semibold text-foreground mb-2">Designation <span className="text-destructive">*</span></label>
              <div className="flex gap-3">
                <button
                  type="button"
                  onClick={() => setDesignation("player")}
                  className={`flex-1 py-3 rounded-lg border font-semibold text-sm transition-all ${
                    designation === "player"
                      ? "bg-primary border-primary text-primary-foreground shadow-lg"
                      : "bg-background border-input text-muted-foreground hover:border-ring hover:text-foreground"
                  }`}
                >
                  Player
                </button>
                <button
                  type="button"
                  onClick={() => setDesignation("coach")}
                  className={`flex-1 py-3 rounded-lg border font-semibold text-sm transition-all ${
                    designation === "coach"
                      ? "bg-primary border-primary text-primary-foreground shadow-lg"
                      : "bg-background border-input text-muted-foreground hover:border-ring hover:text-foreground"
                  }`}
                >
                  Coach
                </button>
              </div>
            </div>
          </div>
        </section>

        {/* Videos + Questions */}
        {VIDEOS.map((video, videoIndex) => (
          <section key={video.id} className="bg-card border border-card-border rounded-2xl p-6 md:p-8 shadow-md space-y-6">
            <h3 className="text-xl font-bold text-foreground flex items-center gap-2">
              <span className="w-7 h-7 rounded-full bg-primary text-primary-foreground text-sm font-bold flex items-center justify-center">
                {videoIndex + 2}
              </span>
              {video.title}
            </h3>

            {/* Video Player */}
            <div className="rounded-xl overflow-hidden border border-border bg-black aspect-video">
              <video
                controls
                className="w-full h-full"
                src={video.url}
                preload="metadata"
              >
                Your browser does not support the video tag.
              </video>
            </div>

            {/* Questions */}
            <div className="space-y-6">
              {video.questions.map((question, qIndex) => (
                <div key={qIndex}>
                  <label className="block text-sm font-semibold text-foreground mb-2">
                    <span className="text-primary mr-1">Q{qIndex + 1}.</span>
                    {question}
                    <span className="text-destructive ml-1">*</span>
                  </label>
                  <textarea
                    required
                    rows={6}
                    value={getAnswer(video.id, qIndex)}
                    onChange={(e) => setAnswer(video.id, qIndex, e.target.value)}
                    placeholder="Write your detailed answer here..."
                    className="w-full px-4 py-3 bg-background border border-input rounded-lg text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:border-ring transition resize-y min-h-[140px]"
                  />
                </div>
              ))}
            </div>
          </section>
        ))}

        {/* Submit */}
        <div className="pb-10">
          <button
            type="submit"
            disabled={submitting}
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
            ) : (
              "Submit Registration"
            )}
          </button>
          <p className="text-center text-muted-foreground text-sm mt-4">
            All fields are required. Make sure you have answered all questions before submitting.
          </p>
        </div>
      </form>
    </div>
  );
}

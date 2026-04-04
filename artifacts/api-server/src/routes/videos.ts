import { Router } from "express";
import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = "https://dooahkczaytnhzarjgen.supabase.co";
const SUPABASE_KEY = "sb_publishable_-CL2B78i2w5RnKdQv7pc6w_g5WTqFTP";

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

const router = Router();

router.get("/videos/:id/stream", async (req, res) => {
  const id = Number(req.params.id);

  if (!id || isNaN(id)) {
    res.status(400).json({ error: "Invalid video id" });
    return;
  }

  const { data, error } = await supabase
    .from("videos")
    .select("url")
    .eq("id", id)
    .single();

  if (error || !data?.url) {
    res.status(404).json({ error: "Video not found" });
    return;
  }

  const dataUrl = data.url as string;

  // Parse data URL: "data:<mimeType>;base64,<data>"
  const commaIdx = dataUrl.indexOf(",");
  const header = commaIdx !== -1 ? dataUrl.slice(0, commaIdx) : "";
  const base64Data = commaIdx !== -1 ? dataUrl.slice(commaIdx + 1) : "";

  const mimeMatch = header.match(/^data:([^;]+)/);
  const mimeType = mimeMatch ? mimeMatch[1] : "video/mp4";

  if (!base64Data) {
    res.status(500).json({ error: "Invalid video data format" });
    return;
  }

  const buffer = Buffer.from(base64Data, "base64");
  const totalLength = buffer.length;

  res.setHeader("Accept-Ranges", "bytes");
  res.setHeader("Content-Type", mimeType);
  res.setHeader("Cache-Control", "private, max-age=3600");

  const rangeHeader = req.headers.range;

  if (rangeHeader) {
    const parts = rangeHeader.replace(/bytes=/, "").split("-");
    const start = parseInt(parts[0], 10);
    const end = parts[1] ? parseInt(parts[1], 10) : totalLength - 1;

    if (start >= totalLength || end >= totalLength || start > end) {
      res.setHeader("Content-Range", `bytes */${totalLength}`);
      res.status(416).end();
      return;
    }

    const chunkSize = end - start + 1;
    const chunk = buffer.subarray(start, end + 1);

    res.setHeader("Content-Range", `bytes ${start}-${end}/${totalLength}`);
    res.setHeader("Content-Length", chunkSize);
    res.status(206).end(chunk);
  } else {
    res.setHeader("Content-Length", totalLength);
    res.status(200).end(buffer);
  }
});

export default router;

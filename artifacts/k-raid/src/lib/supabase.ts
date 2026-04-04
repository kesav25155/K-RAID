import { createClient } from "@supabase/supabase-js";

const supabaseUrl = "https://dooahkczaytnhzarjgen.supabase.co";
const supabaseKey = "sb_publishable_-CL2B78i2w5RnKdQv7pc6w_g5WTqFTP";

export const supabase = createClient(supabaseUrl, supabaseKey);

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String url =
      "https://fchpvnsbimqnsxgevcta.supabase.co"; // thay bằng URL của bạn
  static const String anonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZjaHB2bnNiaW1xbnN4Z2V2Y3RhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY2MzE3MjcsImV4cCI6MjA3MjIwNzcyN30.2NkFfR-DyuQFPDO5ZVMKoKjU4QNCX5Zlcb0WCglizXs"; // thay bằng anon key của bạn

  static final SupabaseClient client = SupabaseClient(url, anonKey);
}

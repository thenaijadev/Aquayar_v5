import 'package:aquayar/config/superbase/interfaces/super_base_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SuperBaseProviderImpl implements SuperBase {
  @override
  Future<void> superBaseInit() async {
    await Supabase.initialize(
      url: 'https://mwukqrbysdwiyonnjfoi.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13dWtxcmJ5c2R3aXlvbm5qZm9pIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI0NDQyMDgsImV4cCI6MjAwODAyMDIwOH0.dscUW1smbhRJUs13-1jbw921WLtvMjK7d_vadyZxJ1w',
    );
  }
}

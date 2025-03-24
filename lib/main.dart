import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(url: Constants.supabaseUrl, anonKey: Constants.supabaseKey);

  runApp(const WhatsappClone());
}

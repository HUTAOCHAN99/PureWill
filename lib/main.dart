import 'package:flutter/material.dart';
import 'package:purewill/screen/auth/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  await Supabase.initialize(
    url: 'https://idmtaoavtbseruxevzho.supabase.co',
    anonKey: 'sb_publishable_wPY_FSIAMcM89znePR8kkQ_24rIpjh0',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PureWill',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
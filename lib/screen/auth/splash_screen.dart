import 'package:flutter/material.dart';
import 'package:purewill/screen/auth/register_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      _redirect(event);
    });
  }

  Future<void> _redirect(AuthChangeEvent event) async {
    if (!mounted) {
      return;
    }

    debugPrint('Auth event: $event');
    debugPrint('masuk sini bang');

    final bool isUserSignedIn = (event == AuthChangeEvent.signedIn);
    if (isUserSignedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  void dispose() {
    Supabase.instance.client.auth.onAuthStateChange.drain();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

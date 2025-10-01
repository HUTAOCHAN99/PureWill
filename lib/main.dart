import 'package:flutter/material.dart';
import 'package:purewill/screen/auth/login_screen.dart';
import 'package:purewill/screen/auth/register_screen.dart';
import 'package:purewill/screen/auth/resetpassword_screen.dart'; 


void main() {
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
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/reset-password': (context) => ResetPasswordScreen(), // Tambah route
      },
    );
  }
}
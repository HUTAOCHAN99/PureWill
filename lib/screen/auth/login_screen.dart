import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:purewill/screen/auth/register_screen.dart';
// import 'package:purewill/screen/auth/resetpassword_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final supabaseCLient = Supabase.instance.client;
  // bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> logIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    debugPrint('Email: $email');
    debugPrint('Password: $password');
    try {
      await supabaseCLient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      debugPrint('Login successful');
    } on AuthException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // void _login() {
    //   final email = _emailController.text.trim();
    //   final password = _passwordController.text.trim();

    //   if (email.isEmpty) {
    //     _showSnackBar("Please enter your email address");
    //     return;
    //   }

    //   if (password.isEmpty) {
    //     _showSnackBar("Please enter your password");
    //     return;
    //   }

    // Implement your login logic here

    // Show success message
    //   _showSnackBar("Login successful!");
    // }

    // void _showSnackBar(String message) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(message),
    //       duration: const Duration(seconds: 3),
    //       behavior: SnackBarBehavior.floating,
    //     ),
    //   );
    // }
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/auth/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.06),
            child: Column(
              children: [
                // Logo section
                Container(
                  height: screenHeight * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.25,
                        height: screenWidth * 0.25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(
                            color: const Color.fromRGBO(102, 121, 163, 1),
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ),
                            child: Image.asset(
                              "assets/images/auth/icon.png",
                              width: screenWidth * 0.24,
                              height: screenWidth * 0.24,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Your journey to self-control starts here",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),

                // Continue text
                const Text(
                  "Continue your journey at",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),

                SizedBox(height: screenHeight * 0.04),

                // Email field
                const Text(
                  "Enter your email address",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),

                SizedBox(height: screenHeight * 0.01),

                // Email TextField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                  ),
                  child: TextField(
                    controller: _emailController,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey[600],
                        size: 20,
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.025),

                // Password field
                const Text(
                  "Create a Password",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),

                SizedBox(height: screenHeight * 0.01),

                // Password TextField
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!, width: 1),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(16),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey[600],
                        size: 20,
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.01),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Forgot password logic
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      await logIn();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Register text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to register
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),

                    // Form section - bagian yang bisa di-scroll
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Container icon dengan teks di samping
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Icon container
                                  Container(
                                    width: screenWidth * 0.15,
                                    height: screenWidth * 0.12,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                        82,
                                        140,
                                        207,
                                        1,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: Colors.grey[300]!,
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                            255,
                                            0,
                                            0,
                                            0,
                                          ).withOpacity(0.1),
                                          blurRadius: 8,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: screenWidth * 0.06,
                                        height: screenWidth * 0.06,
                                        child: Image.asset(
                                          "assets/images/auth/icon_walk.png",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  // Teks di samping icon
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome Back",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.038,
                                          fontWeight: FontWeight.bold,
                                          height: 1.1,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: screenWidth * 0.02,
                                        ),
                                        child: Text(
                                          "Continue",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenWidth * 0.038,
                                            fontWeight: FontWeight.bold,
                                            height: 1.1,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Journey Sir",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.038,
                                          fontWeight: FontWeight.bold,
                                          height: 1.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: screenHeight * 0.05),

                    // Help section
                    // Container(
                    //   width: double.infinity,
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //       Text(
                    //         "Need help?",
                    //         style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: screenWidth * 0.035,
                    //           fontWeight: FontWeight.w400,
                    //         ),
                    //       ),
                    //       SizedBox(height: 4),
                    //       GestureDetector(
                    //         onTap: () {
                    //           // Contact support logic
                    //         },
                    //         child: Text(
                    //           "Contact support",
                    //           style: TextStyle(
                    //             color: Color.fromRGBO(82, 140, 207, 1),
                    //             fontSize: screenWidth * 0.038,
                    //             fontWeight: FontWeight.bold,
                    //             decoration: TextDecoration.underline,
                    //             decorationColor: Color.fromRGBO(82, 140, 207, 1),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

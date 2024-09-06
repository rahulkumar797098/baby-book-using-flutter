import 'package:baby_book/screen/authentication/signup_screen.dart';
import 'package:baby_book/screen/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'authentication_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final AuthService _authService = AuthService(); // Initialize your AuthService

  AnimationController? mController;

  @override
  void initState() {
    super.initState();
    mController = AnimationController(vsync: this, duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    mController?.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final result = await _authService.login(email, password);

      if (result != null) {
        // Successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  CollectionScreen()),
        );
      } else {
        // Handle case where result is null
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed. Please check your credentials.')),
        );
      }
    } catch (e) {
      // Catch any errors that might occur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Opacity
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/anim9.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Opacity(

              opacity: 0.2,

              child: Container(
                color: Colors.black.withOpacity(0.2),


              ),
            ),
          ),
          // Foreground Content
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  Lottie.asset(
                    "assets/lottie/onetwothree.json",
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    onLoaded: (lottie) {
                      mController!.duration = lottie.duration * 2; // Slowing down the animation by 2x
                      mController!.forward(); // Start the animation
                    },
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Login to Your Baby's Reading Adventure",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          shadows: [Shadow(color: Colors.red , blurRadius: 7 , offset: Offset(1.5, 1.0))],
                          fontSize: 25, color: Colors.white),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 8,
                        shadowColor: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  label: const Text(
                                    "Email",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  hintStyle: const TextStyle(fontSize: 25),
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: const Color(0xfbf8d581),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email_sharp,
                                    size: 30,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              TextField(
                                controller: passwordController,
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  label: const Text(
                                    "Password",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  hintStyle: const TextStyle(fontSize: 25),
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: const Color(0xfbf8d581),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    size: 30,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible = !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              elevation: 10,
                              side: const BorderSide(width: 1, color: Colors.green),
                              shadowColor: Colors.red,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30) , topRight: Radius.circular(30) , bottomLeft: Radius.circular(5) , topLeft: Radius.circular(5)),
                              ),
                            ),
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 30, color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(width: 10,),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(width: 2 , color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

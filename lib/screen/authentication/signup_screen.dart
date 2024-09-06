import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'authentication_helper.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isVisible = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  final AuthService _authService = AuthService();

  Future<void> _signUp() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmController.text.trim();

    if (name.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fill all the required blanks!!")),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    final result = await _authService.signUp(email, password);

    if (result != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign Up Failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/girls.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Optional: Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          // Foreground Content
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child:Lottie.asset(
                            "assets/lottie/cat.json",
                            height: 250,
                            width: 250,
                            alignment: Alignment.center,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Join Baby's Reading Journey",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 2,
                                offset: Offset(2.0, 2.0),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          color: Colors.white30,
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    label: const Text(
                                      "Enter Your Name",
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
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.account_circle_sharp,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    label: const Text(
                                      "Enter your e-mail",
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
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.email_sharp,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                TextField(
                                  controller: passwordController,
                                  obscureText: !isVisible,
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
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 30,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      icon: Icon(
                                        isVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                TextField(
                                  controller: confirmController,
                                  obscureText: !isVisible,
                                  decoration: InputDecoration(
                                    label: const Text(
                                      "Confirm Password",
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
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none,
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      size: 30,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      icon: Icon(
                                        isVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: 200,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            elevation: 20,
                            side:
                                const BorderSide(width: 1, color: Colors.green),
                            shadowColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(5)),
                            ),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 25, color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You have an account?",
                          style: TextStyle(fontSize: 20 , color: Colors.white),
                        ),
                        const SizedBox(width: 10,),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(width: 2 , color: Colors.redAccent),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 25, color: Colors.white),
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

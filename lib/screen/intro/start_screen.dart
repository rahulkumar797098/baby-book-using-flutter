import 'package:baby_book/screen/authentication/login_screen.dart';
import 'package:baby_book/screen/collection_screen.dart';
import 'package:baby_book/screen/intro/parents_child_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/boll.json"),
          const Text(
            "Discover Magical Tales for Your Little One",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ParentsChildScreen()));
            },
            child: Container(
              width: 300,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/arrow.png"),
                  fit: BoxFit
                      .contain, // Ensures the image fits inside the container
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

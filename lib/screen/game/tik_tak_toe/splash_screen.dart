import 'dart:async';
import 'package:baby_book/screen/game/tik_tak_toe/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../colors.dart';


class SplashScreen extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TikStartScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: spColorTTT,
        child: Center(
          child: Container(
              height: 200,
              width: 200,
              child: Image.asset("assets/images/tic-tac-toe.png")),
        ),
      ),
    );
  }
}

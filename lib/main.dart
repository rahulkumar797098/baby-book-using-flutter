
import 'package:baby_book/screen/authentication/login_screen.dart';
import 'package:baby_book/screen/authentication/signup_screen.dart';
import 'package:baby_book/screen/collection_screen.dart';
import 'package:baby_book/screen/intro/parents_child_screen.dart';
import 'package:baby_book/screen/intro/start_screen.dart';
import 'package:baby_book/screen/parents/dashbord_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const StartScreen()
    );
  }
}



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
  WidgetsFlutterBinding.ensureInitialized();
  print('Initializing Firebase...');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print('Firebase Initialized');
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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


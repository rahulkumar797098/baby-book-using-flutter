import 'package:baby_book/screen/animal_screen.dart';
import 'package:baby_book/screen/audio_play.dart';
import 'package:baby_book/screen/collection_screen.dart';
import 'package:baby_book/screen/multiplication_table.dart';
import 'package:baby_book/screen/number_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: AnimalScreen()
    );
  }
}


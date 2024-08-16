import 'package:baby_book/screen/animal_screen.dart';
import 'package:baby_book/screen/audio_play.dart';
import 'package:baby_book/screen/body_parts_screen.dart';
import 'package:baby_book/screen/collection_screen.dart';
import 'package:baby_book/screen/english_poems_screen.dart';
import 'package:baby_book/screen/flower_screen.dart';
import 'package:baby_book/screen/fruits_screen.dart';
import 'package:baby_book/screen/full_screen_image_show.dart';
import 'package:baby_book/screen/multiplication_table.dart';
import 'package:baby_book/screen/music_instruments.dart';
import 'package:baby_book/screen/number_screen.dart';
import 'package:baby_book/screen/transport_screen.dart';
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
      home: FullScreenImageShow()
    );
  }
}


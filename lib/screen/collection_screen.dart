import 'package:baby_book/screen/a_for_apple_screen.dart';
import 'package:baby_book/screen/animal_screen.dart';
import 'package:baby_book/screen/body_parts_screen.dart';
import 'package:baby_book/screen/english_poems_screen.dart';
import 'package:baby_book/screen/fruits_screen.dart';
import 'package:baby_book/screen/hindi_book_screen.dart';
import 'package:baby_book/screen/multiplication_table.dart';
import 'package:baby_book/screen/music_instruments.dart';
import 'package:baby_book/screen/number_screen.dart';
import 'package:baby_book/screen/transport_screen.dart';
import 'package:flutter/material.dart';

class CollectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  List<Map<String, dynamic>> collection = [
    {"image": Image.asset("assets/images/abcd.png"), "title": "English Book"},
    {"image": Image.asset("assets/hindi/hindi.png"), "title": "हिंदी किताब"},
    {"image": Image.asset("assets/images/onetwo.png"), "title": "One-Two"},
    {"image": Image.asset("assets/images/table.png"), "title": "Table Time"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "Animal"},
    {"image": Image.asset("assets/poem/poem.png"), "title": "English Poem"},
    {"image": Image.asset("assets/music/music.png"), "title": "Music instruments"},
    {"image": Image.asset("assets/body/body.jpg"), "title": "Body part"},
    {"image": Image.asset("assets/fruits/mix.png"), "title": "Fruits"},
    {"image": Image.asset("assets/transport/mix.png"), "title": "Transport"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "English Book"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "English Book"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "English Book"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "English Book"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "English Book"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "English Book"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "English Book"},
    {"image": Image.asset("assets/images/zoo.png"), "title": "English Book"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Education"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: collection.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (collection[index]["title"] == "English Book") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AForAppleScreen()));
              } else if (collection[index]["title"] == "हिंदी किताब") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HindiBookScreen()));
              } else if (collection[index]["title"] == "One-Two") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NumberScreen()));
              } else if (collection[index]["title"] == "Table Time") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MultiplicationTable()));
              } else if (collection[index]["title"] == "Animal") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimalScreen()));
              } else if (collection[index]["title"] == "English Poem") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnglishPoemsScreen()));
              } else if (collection[index]["title"] == "Music instruments") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MusicInstrumentsScreen()));
              } else if (collection[index]["title"] == "Body part") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BodyPartsScreen()));
              } else if (collection[index]["title"] == "Fruits") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FruitsScreen()));
              }else if (collection[index]["title"] == "Transport") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TransportScreen()));
              }
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                    width: 120,
                    child: collection[index]["image"],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    collection[index]["title"],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

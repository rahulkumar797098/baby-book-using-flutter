import 'package:baby_book/screen/full_screen_image_show.dart';
import 'package:flutter/material.dart';

class EnglishBookModel {
  final String title;
  final String small;
  final String means;
  final String hindi;
  final String image;

  EnglishBookModel(
      {required this.image,
      required this.title,
      required this.means,
      required this.small,
      required this.hindi});
}

class AForAppleScreen extends StatefulWidget {
  final List<EnglishBookModel> books = [
    EnglishBookModel(
        title: "A",
        small: "a",
        image: "assets/images/apple.png",
        means: 'Apple',
        hindi: "सेब"),
    EnglishBookModel(
        title: "B",
        small: "b",
        image: "assets/images/boll.png",
        means: 'Ball',
        hindi: "गेंद"),
    EnglishBookModel(
        title: "C",
        small: "c",
        image: "assets/images/cat.png",
        means: 'Cat',
        hindi: "बिल्ली"),
    EnglishBookModel(
        title: "D",
        small: "d",
        image: "assets/images/dog.png",
        means: 'Dog',
        hindi: "कुत्ता"),
    EnglishBookModel(
        title: "E",
        small: "e",
        image: "assets/images/egg.png",
        means: 'Egg',
        hindi: "अंडा"),
    EnglishBookModel(
        title: "F",
        small: "f",
        image: "assets/images/fan.png",
        means: 'Fan',
        hindi: "पंखा"),
    EnglishBookModel(
        title: "G",
        small: "g",
        image: "assets/images/girl.png",
        means: 'Girl',
        hindi: "लड़की"),
    EnglishBookModel(
        title: "H",
        small: "h",
        image: "assets/images/house.webp",
        means: 'House',
        hindi: "घर"),
    EnglishBookModel(
        title: "I",
        small: "i",
        image: "assets/images/icecream.png",
        means: 'Ice-Cream',
        hindi: "आइसक्रीम"),
    EnglishBookModel(
        title: "J",
        small: "j",
        image: "assets/images/jocker.png",
        means: 'Jocker',
        hindi: "जोकर"),
    EnglishBookModel(
        title: "K",
        small: "k",
        image: "assets/images/kite.png",
        means: 'kite',
        hindi: "पतंग"),
    EnglishBookModel(
        title: "L",
        small: "l",
        image: "assets/images/lion.png",
        means: 'Lion',
        hindi: "शेर"),
    EnglishBookModel(
        title: "M",
        small: "m",
        image: "assets/images/mango.png",
        means: 'Mango',
        hindi: "आम"),
    EnglishBookModel(
        title: "N",
        small: "n",
        image: "assets/images/nest.webp",
        means: 'Nest',
        hindi: "घोंसला"),
    EnglishBookModel(
        title: "O",
        small: "o",
        image: "assets/images/orange.png",
        means: 'Orange',
        hindi: "नारंगी"),
    EnglishBookModel(
        title: "P",
        small: "p",
        image: "assets/images/pencil.png",
        means: 'Pencil',
        hindi: "पेंसिल"),
    EnglishBookModel(
        title: "Q",
        small: "q",
        image: "assets/images/queen.png",
        means: 'Queen',
        hindi: "रानी"),
    EnglishBookModel(
        title: "R",
        small: "r",
        image: "assets/images/rabbit.png",
        means: 'Rabbit',
        hindi: "खरगोश"),
    EnglishBookModel(
        title: "S",
        small: "s",
        image: "assets/images/sheep.png",
        means: 'Sheep',
        hindi: "भेड़"),
    EnglishBookModel(
        title: "T",
        small: "t",
        image: "assets/images/toy.png",
        means: 'Toy',
        hindi: "खिलौने"),
    EnglishBookModel(
        title: "U",
        small: "u",
        image: "assets/images/umberally.png",
        means: 'umbrella',
        hindi: "छाता"),
    EnglishBookModel(
        title: "V",
        small: "v",
        image: "assets/images/van.png",
        means: 'Van',
        hindi: "वैन"),
    EnglishBookModel(
        title: "W",
        small: "w",
        image: "assets/images/watch.png",
        means: 'Watch',
        hindi: "घड़ी"),
    EnglishBookModel(
        title: "X",
        small: "x",
        image: "assets/images/xray.png",
        means: 'X-Ray',
        hindi: "एक्स-रे"),
    EnglishBookModel(
        title: "Y",
        small: "y",
        image: "assets/images/yak.webp",
        means: 'Yak',
        hindi: " याक"),
    EnglishBookModel(
        title: "Z",
        small: "z",
        image: "assets/images/zoo.png",
        means: 'Zoo',
        hindi: "चिड़ियाघर"),
  ];

  @override
  State<StatefulWidget> createState() => _AForAppleScreenState();
}

class _AForAppleScreenState extends State<AForAppleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("English Book"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: widget.books.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Number of columns
        ),
        itemBuilder: (BuildContext context, int index) {
          final book = widget.books[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullScreenImageShow(
                            imagePaths:widget.books.map((b) => b.image).toList(),
                            titles: widget.books.map((b) => b.title).toList(),
                            means: widget.books.map((b) => b.means).toList(),
                            smalls: widget.books.map((b) => b.small).toList(),
                            hindis: widget.books.map((b) => b.hindi).toList(),
                          )));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Card(
                elevation: 5,
                shadowColor: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: AssetImage(book.image))),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            book.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            book.means,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 40),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(book.small,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(book.hindi,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

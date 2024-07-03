import 'package:flutter/material.dart';

class EnglishBookModel {
  final String title;
  final String small ;
  final String means ;
  final String hindi ;
  final Image image;

  EnglishBookModel({
    required this.image,
    required this.title ,
    required this.means ,
    required this.small ,
    required this.hindi
  });
}

class AForAppleScreen extends StatefulWidget {
  final List<EnglishBookModel> books = [
    EnglishBookModel(title: "A" , small : "a" ,image: Image.asset("assets/images/apple.png"), means: 'Apple' , hindi: "सेब" ),
    EnglishBookModel(title: "B", small : "b" , image: Image.asset("assets/images/boll.png"), means: 'Ball', hindi: "गेंद" ),
    EnglishBookModel(title: "C",  small : "c" ,image: Image.asset("assets/images/cat.png"), means: 'Cat', hindi: "बिल्ली" ),
    EnglishBookModel(title: "D", small : "d" ,image: Image.asset("assets/images/dog.png"), means: 'Dog', hindi: "कुत्ता" ),
    EnglishBookModel(title: "E", small : "e" ,image: Image.asset("assets/images/egg.png"), means: 'Egg', hindi: "अंडा" ),
    EnglishBookModel(title: "F"  , small : "f" , image: Image.asset("assets/images/fan.png"), means: 'Fan', hindi: "पंखा" ),
    EnglishBookModel(title: "G" , small : "g" , image: Image.asset("assets/images/girl.png"), means: 'Girl', hindi: "लड़की" ),
    EnglishBookModel(title: "H" , small : "h" , image: Image.asset("assets/images/house.webp"), means: 'House', hindi: "घर" ),
    EnglishBookModel(title: "I" , small : "i" , image: Image.asset("assets/images/icecream.png"), means: 'Ice-Cream' , hindi: "आइसक्रीम"),
    EnglishBookModel(title: "J" , small : "j" ,image: Image.asset("assets/images/jocker.png"), means: 'Jocker' , hindi: "जोकर"),
    EnglishBookModel(title: "K", small : "k" , image: Image.asset("assets/images/kite.png"), means: 'kite' , hindi: "पतंग"),
    EnglishBookModel(title: "L", small : "l" , image: Image.asset("assets/images/lion.png"), means: 'Lion' , hindi: "शेर"),
    EnglishBookModel(title: "M", small : "m" , image: Image.asset("assets/images/mango.png"), means: 'Mango', hindi: "आम" ),
    EnglishBookModel(title: "N", small : "n" , image: Image.asset("assets/images/nest.webp"), means: 'Nest', hindi: "घोंसला" ),
    EnglishBookModel(title: "O", small : "o" , image: Image.asset("assets/images/orange.png"), means: 'Orange', hindi: "नारंगी" ),
    EnglishBookModel(title: "P", small : "p" , image: Image.asset("assets/images/pencil.png"), means: 'Pencil' , hindi: "पेंसिल"),
    EnglishBookModel(title: "Q", small : "q" , image: Image.asset("assets/images/queen.png"), means: 'Queen' , hindi: "रानी"),
    EnglishBookModel(title: "R", small : "r" , image: Image.asset("assets/images/rabbit.png"), means: 'Rabbit', hindi: "खरगोश" ),
    EnglishBookModel(title: "S", small : "s" , image: Image.asset("assets/images/sheep.png"), means: 'Sheep' , hindi: "भेड़"),
    EnglishBookModel(title: "T", small : "t" , image: Image.asset("assets/images/toy.png"), means: 'Toy' , hindi: "खिलौने"),
    EnglishBookModel(title: "U", small : "u" , image: Image.asset("assets/images/umberally.png"), means: 'umbrella' , hindi: "छाता"),
    EnglishBookModel(title: "V", small : "v" , image: Image.asset("assets/images/van.png"), means: 'Van' , hindi: "वैन"),
    EnglishBookModel(title: "W", small : "w" , image: Image.asset("assets/images/watch.png"), means: 'Watch', hindi: "घड़ी" ),
    EnglishBookModel(title: "X", small : "x" , image: Image.asset("assets/images/xray.png"), means: 'X-Ray', hindi: "एक्स-रे" ),
    EnglishBookModel(title: "Y", small : "y" , image: Image.asset("assets/images/yak.webp"), means: 'Yak' , hindi: " याक"),
    EnglishBookModel(title: "Z", small : "z" , image: Image.asset("assets/images/zoo.png"), means: 'Zoo' , hindi: "चिड़ियाघर"),
  ];

  @override
  State<StatefulWidget> createState() => _AForAppleScreenState();
}

class _AForAppleScreenState extends State<AForAppleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("English Book"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: widget.books.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Number of columns
                 ),
        itemBuilder: (BuildContext context, int index) {
          final book = widget.books[index];
          return Padding(
            padding: const EdgeInsets.only(left: 16 ,  right:  16 , top: 16),
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
                        child: book.image ,

                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          book.title,
                          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(book.means ,
                          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 40),
                        ),
                      )
                    ],
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10 , ),
                        child: Text(book.small , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30)),
                      ) ,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(book.hindi ,  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30 )),
                      ) ,


                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

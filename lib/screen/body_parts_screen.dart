import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyPartsScreen extends StatefulWidget {
  const BodyPartsScreen({super.key});

  @override
  State<BodyPartsScreen> createState() => _BodyPartsScreenState();
}

class _BodyPartsScreenState extends State<BodyPartsScreen> {
  List<Map<String, dynamic>> part = [
    {"title": "Hair", "image": "assets/body/hair.webp"},
    {"title": "Head", "image": "assets/body/head.webp"},
    {"title": "Eye", "image": "assets/body/eye.jpg"},
    {"title": "Nose", "image": "assets/body/nose.jpg"},
    {"title": "Ear", "image": "assets/body/ear.jpg"},
    {"title": "Mouth", "image": "assets/body/mouth.jpg"},
    {"title": "Tongue", "image": "assets/body/tongue.webp"},
    {"title": "Teeth", "image": "assets/body/lips.jpg"},
    {"title": "Lips", "image": "assets/body/mouth.jpg"},
    {"title": "Cheek", "image": "assets/body/cheecks.jpg"},
    {"title": "Mouth", "image": "assets/body/mouth.jpg"},
    {"title": "Mouth", "image": "assets/body/mouth.jpg"},
    {"title": "Mouth", "image": "assets/body/mouth.jpg"},
    {"title": "Mouth", "image": "assets/body/mouth.jpg"},
    {"title": "Mouth", "image": "assets/body/mouth.jpg"},
    {"title": "Mouth", "image": "assets/body/mouth.jpg"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Parts"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Body Image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/body/body.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            //
      GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
        childAspectRatio: 2/2.4
    ),
    itemCount: part.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.yellow.withOpacity(0.7),
            elevation: 5,
            shadowColor: Colors.red,
            child: Column(
              children: [
                Card(
                  child: SizedBox(
                    height: 140,
                    width: double.infinity, // Take full width of the card
                    child: Image.asset(
                      part[index]["image"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(part[index]["title"] ,
                    style: const TextStyle(fontSize: 30 ,
                        fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black , blurRadius: 3 , offset:Offset(2.4, 2.5) )]

                    ),
                  ),
                ),
               
              ],
            ),
          )

      );
    }
      )
          ],

        ),
      ),
    );
  }
}

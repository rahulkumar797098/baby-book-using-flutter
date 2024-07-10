import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnglishPoemsScreen extends StatelessWidget {
  const EnglishPoemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> poems = [
      {
        "title": "Twinkle, Twinkle, Little Star",
        "image": "assets/poem/poem1.png",
        "poem":
            "Twinkle, twinkle, little star, How I wonder what you are!Up above the world so high, Like a diamond in the sky."
      },
      {
        "title": "Humpty Dumpty",
        "image": "assets/poem/poem2.png",
        "poem":
            "Humpty Dumpty sat on a wall, Humpty Dumpty had a great fall. All the king's horses and all the king's menCouldn't put Humpty together again."
      },

      {
        "title": "Mary Had a Little Lamb",
        "image": "assets/poem/poem3.jpeg",
        "poem":
        "Mary had a little lamb, Its fleece was white as snow; And everywhere that Mary went, The lamb was sure to go."
      } ,

      {
        "title": "Jack and Jill",
        "image": "assets/poem/poem4.png",
        "poem":"Jack and Jill went up the hillTo fetch a pail of water. Jack fell down and broke his crown, And Jill came tumbling after."
      } ,

      {
        "title": "Baa, Baa, Black Sheep",
        "image": "assets/poem/poem5.jpg",
        "poem":"Baa, baa, black sheep, Have you any wool?Yes sir,  yes sir, Three bags full."
      } ,

      {
        "title": "Star Light, Star Bright",
        "image": "assets/poem/poem6.jpg",
        "poem":"Star light, star bright, First star I see tonight, I wish I may, I wish I might,  Have the wish I wish tonight."
      }



    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Poems"),
        centerTitle: true,
      ),
      body: PageView.builder(
        itemCount: poems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 5,
              shadowColor: Colors.red,
              child: Column(
                children: [
                 const SizedBox(
                    height: 10,
                  ),
                  Text(
                    poems[index]["title"],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(poems[index]["image"]),
                            fit: BoxFit.cover)),
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                        child: Text(
                      poems[index]["poem"],
                      style: const TextStyle(
                        fontSize: 30,
                        wordSpacing: 5,
                      ),
                    )),
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

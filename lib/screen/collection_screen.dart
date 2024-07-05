import 'package:flutter/material.dart';

class CollectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  List<Map<String, dynamic>> collection = [
    {
      "image": Image.asset("assets/images/zoo.png"),
      "title": "English Book"
    },

    {
      "image": Image.asset("assets/images/zoo.png"),
      "title": "English Book"
    },

    {
      "image": Image.asset("assets/images/zoo.png"),
      "title": "English Book"
    },

    {
      "image": Image.asset("assets/images/zoo.png"),
      "title": "English Book"
    },

    {
      "image": Image.asset("assets/images/zoo.png"),
      "title": "English Book"
    },

    {
      "image": Image.asset("assets/images/zoo.png"),
      "title": "English Book"
    },

    {
      "image": Image.asset("assets/images/zoo.png"),
      "title": "English Book"
    },

    {
      "image": Image.asset("assets/images/zoo.png"),
      "title": "English Book"
    }
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: collection[index]["image"],
                ),
                Text(
                  collection[index]["title"],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


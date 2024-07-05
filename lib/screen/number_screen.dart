import 'package:flutter/material.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Change this value according to your requirement
        ),
        itemCount: 100, // Number of items in the grid
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.red,
              shadowColor: Colors.deepPurple,
              elevation: 5,
              child: Center(
                child: Text(
                  '${index + 1}', // Display the number 1 to 100
                  style:const TextStyle(fontSize: 60, fontWeight: FontWeight.w900 , color: Colors.white ,
                    shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ], ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

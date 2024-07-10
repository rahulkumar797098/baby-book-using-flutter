import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<FruitsScreen> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  
  List<Map<String , dynamic>> fruits = [
    {"title" : "Apple" , "image" : "assets/fruits/apple.png"},
    {"title" : "Banana" , "image" : "assets/fruits/banana.png"},
    {"title" : "Orange" , "image" : "assets/fruits/orange.png"},
    {"title" : "Litchi" , "image" : "assets/fruits/lichi.png"},
    {"title" : "Pomegranate" , "image" : "assets/fruits/pomgranate.png"} ,
    {"title" : "Guava" , "image" : "assets/fruits/guava.png"},
    {"title" : "Grapes" , "image" : "assets/fruits/prapes.png"},
    {"title" : "Straw berry" , "image" : "assets/fruits/strawberry.png"},
    {"title" : "Pineapple" , "image" : "assets/fruits/pineapple.png"} ,
    {"title" : "Lemon " , "image" : "assets/fruits/lemon.png"} ,
    {"title" : "watermelon" , "image" : "assets/fruits/watermelon.png"} ,
    {"title" : "Muskmelon " , "image" : "assets/fruits/muskmelon.png"} ,
    {"title" : "Papaya " , "image" : "assets/fruits/papaya.png"} ,
    {"title" : "Mango " , "image" : "assets/fruits/mango.png"} ,

  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fruit Screen"),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: fruits.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2 ,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2/2.8
            ), itemBuilder: (context , index) {
              return Card(
                elevation: 5,
                shadowColor: Colors.red,
                color: const Color(0xffffcce6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: 200,
                        child: Image.asset(fruits[index]["image"])) ,

                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xfffdb3d9),
                          borderRadius:const BorderRadius.only(bottomRight:Radius.circular(10) , bottomLeft: Radius.circular(10) ),
                          border: Border.all(width: 1 , color: Colors.red)
                        ),
                          child: Text(fruits[index]["title"]  ,
                            style: const TextStyle(fontSize: 25 ,
                                fontWeight: FontWeight.bold ,
                            color: Colors.white ,
                              shadows: [Shadow(color: Colors.black , blurRadius: 3 , offset: Offset(2.3,2.5))]
                            )  ,
                            textAlign: TextAlign.center,)
                      ),
                    )

                  ],
                ),

              );
        }),
      )
    );
  }
}

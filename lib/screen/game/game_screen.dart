import 'package:baby_book/screen/game/tik_tak_toe/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Map<String, dynamic>> game = [
    {"title": "Tik-tak-toe", "image": "assets/images/tic-tac-toe.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game"),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: game.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.5,
              mainAxisSpacing: 5.5,
              crossAxisSpacing: 5.5),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                if(game[index]["title"] == "Tik-tak-toe"){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()));
                }
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(game[index]["image"]),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        game[index]["title"],
                        style: const TextStyle(fontSize: 25),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

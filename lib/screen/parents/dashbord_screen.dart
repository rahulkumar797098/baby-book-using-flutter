import 'package:baby_book/screen/collection_screen.dart';
import 'package:baby_book/screen/game/game_screen.dart';
import 'package:baby_book/screen/video/video_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBordScreen extends StatefulWidget {
  const DashBordScreen({super.key});

  @override
  State<DashBordScreen> createState() => _dashBordScreenState();
}

class _dashBordScreenState extends State<DashBordScreen> {
  int _indexValue = 0;

  // list of screen that is to be shown on the tap of each item
  final List<Widget> _screenList = [
     CollectionScreen() ,
    const GameScreen() ,
    const VideoScreen() ,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[
          _indexValue], // passing index value so screen will change dynamically
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.orangeAccent,
        color: Colors.greenAccent,
        index: _indexValue, // update index
        onTap: (index) {
          setState(() {
            _indexValue = index; // updating index on each tap
          });
        },

        items: [
          // _buildNavItem is a method that is used to build nav item using this to customize items because CurvedNavigationBar doesn't provide attribute to customize the nav item
          _buildNavItem("assets/images/book.png", "Home"),
          _buildNavItem("assets/images/game.png", "Game"),
          _buildNavItem("assets/images/video.png", "Video"),
        ],

        backgroundColor: Colors.transparent,

        // speed of animation
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  Widget _buildNavItem(String icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        width: 45,
        height: 45,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              icon,
              height: 30,
              width: 30,
            ),
            Positioned(
              bottom: 0,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

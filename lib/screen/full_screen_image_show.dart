import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FullScreenImageShow extends StatefulWidget {
  final List<String> imagePaths; // Accept a list of image paths
  final List<String> titles;
  final List<String> means;
  final List<String> smalls;
  final List<String> hindis;

  const FullScreenImageShow({
    super.key,
    required this.imagePaths,
    required this.titles,
    required this.means,
    required this.smalls,
    required this.hindis,
  });

  @override
  State<FullScreenImageShow> createState() => _FullScreenImageShowState();
}

class _FullScreenImageShowState extends State<FullScreenImageShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.imagePaths.length, // Use the length of the image list
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Positioned(
                top: 35,
                left: 0,
                child: Lottie.asset(
                  "assets/lottie/rabbit.json",
                  height: 200,
                  width: 200,
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 450,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.greenAccent,
                          shadowColor: Colors.orangeAccent,
                          elevation: 5,
                          child: Column(
                            children: [
                              Image.asset(
                                height: 300,
                                width: 300,
                                widget.imagePaths[
                                    index], // Access image path for the current index
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.titles[
                                          index], // Access title for the current index
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                    Text(
                                      widget.means[
                                          index], // Access means for the current index
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.smalls[
                                          index], // Access small for the current index
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                    Text(
                                      widget.hindis[
                                          index], // Access hindi for the current index
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/baby_teacher.png",
                  height: 220,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

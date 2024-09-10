import 'package:baby_book/screen/authentication/login_screen.dart';
import 'package:baby_book/screen/collection_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ParentsChildScreen extends StatefulWidget {
  const ParentsChildScreen({super.key});

  @override
  State<ParentsChildScreen> createState() => _ParentsChildScreenState();
}

class _ParentsChildScreenState extends State<ParentsChildScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.orangeAccent,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/parentsimg.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orangeAccent,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              topLeft: Radius.circular(3),
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30)))),
                  child: const Text(
                    "Parents",
                    style: TextStyle(fontSize: 25, fontFamily: "myFontFirst"),
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shadowColor: Colors.blueAccent,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/babybook.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(3),
                              topLeft: Radius.circular(3),
                              bottomRight: Radius.circular(30),
                              topRight: Radius.circular(30)))),
                  child: const Text(
                    "Children",
                    style: TextStyle(fontSize: 25, fontFamily: "myFontFirst"),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

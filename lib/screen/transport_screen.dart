import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TransportScreen extends StatefulWidget {
  const TransportScreen({super.key});

  @override
  State<TransportScreen> createState() => _TransportScreenState();
}

class _TransportScreenState extends State<TransportScreen> {
  // Transport 1
  final List<Map<String, dynamic>> transport2 = [
    {
      "image": "assets/transport/bicycle.png",
      "name": "Bi-cycle",
    },
    {
      "image": "assets/transport/motercycle.png",
      "name": "Moter cycle",
    },
    {
      "image": "assets/transport/car.png",
      "name": "Car",
    },
    {
      "image": "assets/transport/jeep.png",
      "name": "Jeep",
    },
    {
      "image": "assets/transport/auto.png",
      "name": "Auto",
    },
    {
      "image": "assets/transport/erickshaw.png",
      "name": "E Richshaw",
    },
    {
      "image": "assets/transport/erickshaw.png",
      "name": "E Richshaw",
    },
  ];

  final List<Map<String, dynamic>> transport1 = [
    {"image": "assets/transport/airoplane.png", "title": "Airoplane"},
    {"image": "assets/transport/bus.png", "title": "Bus"},
    {"image": "assets/transport/halicopter.png", "title": "Helicopter"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transport"),
        centerTitle: true,
      ),

      // ............BODY............//
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < transport1.length; i++) ...[
              //  for transport1 image
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 250,
                  child: Card(
                    elevation: 5,
                    shadowColor: Colors.red,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            transport1[i]["image"],
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.fill, // image ko fit karne ke liye
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              border: Border.all(width: 2, color: Colors.red),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                transport1[i]["title"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Transport2
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2 // Number of columns
                    ),
                itemBuilder: (BuildContext context, int index) {
                  int transport1Index = i * 2 + index;
                  if (transport1Index >= transport2.length) return Container();
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            transport2[transport1Index]["image"],
                            width: double.infinity,
                            height: 120,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                transport2[transport1Index]["name"],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MultiplicationTable extends StatelessWidget {
  const MultiplicationTable({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> boxColor = [
      Colors.red.shade400,
      Colors.pinkAccent.shade100,
      Colors.blue.shade400,
      Colors.greenAccent.shade400,
      Colors.green.shade400,
      Colors.cyanAccent.shade400,
      Colors.deepPurple.shade400,
      Colors.deepOrangeAccent.shade400,
      Colors.amberAccent.shade400,
      Colors.greenAccent.shade400,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "2 TO 20",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: PageView.builder(
        itemCount: 19,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              color: boxColor[index % boxColor.length],
              shadowColor: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    // here we call table function
                    table(index + 2),
                    style: const TextStyle(fontSize: 45, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Table print function
  String table(int num) {
    StringBuffer tableOutput = StringBuffer();
    for (int i = 1; i <= 10; i++) {
      tableOutput.writeln('$num x $i = ${num * i}');
    }
    return tableOutput.toString();
  }
}

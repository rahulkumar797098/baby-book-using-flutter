import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlowerScreen(),
    );
  }
}

class FlowerScreen extends StatefulWidget {
  @override
  _FlowerScreenState createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  List<Map<String, String>> flowers = [];

  @override
  void initState() {
    super.initState();
    fetchFlowerData();
  }

  Future<void> fetchFlowerData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionRef = firestore.collection('babyData');

    QuerySnapshot querySnapshot = await collectionRef.get();
    final List<Map<String, String>> loadedFlowers = [];

    for (var doc in querySnapshot.docs) {
      Map<String, String> flowerData = {
        'name': doc['title'],
        'imageUrl': doc['image'],
      };
      loadedFlowers.add(flowerData);
    }

    setState(() {
      flowers = loadedFlowers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flower"),centerTitle: true,
      ),
      body: flowers.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        itemCount: flowers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4, // Adjust aspect ratio if needed
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(
                    flowers[index]['imageUrl']!,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    flowers[index]['name']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int _currentIndex = -1;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(int index) async {
    try {
      // Stop previously playing audio if any
      if (_currentIndex != -1 && _currentIndex != index) {
        await _audioPlayer.stop();
        setState(() {
          isPlaying = false;
          _currentIndex = -1;
        });
      }
      // Play the selected audio
      await _audioPlayer.play(AssetSource(animals[index]["sound"]));
      setState(() {
        isPlaying = true;
        _currentIndex = index;
      });
    } catch (e) {
      print("Play Error: $e");
    }
  }

  Future<void> _pauseAudio() async {
    try {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } catch (e) {
      print("Pause Error: $e");
    }
  }

  Future<void> _toggleAudio(int index) async {
    if (isPlaying && _currentIndex == index) {
      await _pauseAudio();
    } else {
      await _playAudio(index);
    }
  }

  final List<Map<String, dynamic>> animals = [
    {"image": "assets/animal/cat.png", "name": "Cat", "hindi": "बिल्ली", "sound": "sound/cat.mp3"},
    {"image": "assets/animal/dog.png", "name": "Dog", "hindi": "कुत्ता", "sound": "sound/dog.mp3"},
    {"image": "assets/animal/rat.png", "name": "Rat", "hindi": "चूहा", "sound": "assets/sound/rat.mp3"},
    {"image": "assets/animal/fish.png", "name": "Fish", "hindi": "मछली", "sound": "sound/fish.mp3"},
    {"image": "assets/animal/elephant.png", "name": "Elephant", "hindi": "हाथी", "sound": "sound/Elephent.mp3"},
    {"image": "assets/animal/cow.png", "name": "Cow", "hindi": "गाय", "sound": "sound/cow.mp3"},
    {"image": "assets/animal/camel.png", "name": "Camel", "hindi": "ऊंट", "sound": "sound/camel.mp3"},
    {"image": "assets/animal/goat.png", "name": "Goat", "hindi": "बकरी", "sound": "sound/goat.mp3"},
    {"image": "assets/animal/buffalo.png", "name": "Buffalo", "hindi": "भैंस", "sound": "sound/buffalo.mp3"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal Grid"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: animals.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1 // Number of columns
        ),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Card(
              elevation: 5,
              shadowColor: Colors.red,
              child: InkWell(
                onTap: () => _toggleAudio(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      animals[index]["image"],
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          animals[index]["name"],
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      FloatingActionButton(onPressed: (){
                        _toggleAudio(index);

                      } , child: Icon(Icons.volume_up_sharp), ),
                        Text(
                          animals[index]["hindi"],
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicInstrumentsScreen extends StatefulWidget {
  const MusicInstrumentsScreen({super.key});

  @override
  State<MusicInstrumentsScreen> createState() => _MusicInstrumentsScreenState();
}

class _MusicInstrumentsScreenState extends State<MusicInstrumentsScreen> {
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
      await _audioPlayer.play(AssetSource(music[index]["sound"]));
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

  final List<Map<String, dynamic>> music = [
    {"image": "assets/music/pia.png", "name": "Piano", "hindi": "पियानो", "sound": "sound/pia.mp3"},
    {"image": "assets/music/gui.png", "name": "Guitar", "hindi": "गिटार", "sound": "sound/gui.mp3"},
    {"image": "assets/music/vio.png", "name": "Violin", "hindi": "वायोलिन", "sound": "sound/vio.mp3"},
    {"image": "assets/music/dru.png", "name": "Drums", "hindi": "ड्रम", "sound": "sound/dru.mp3"},
    {"image": "assets/music/tab.png", "name": "Tabla", "hindi": "तबला", "sound": "sound/tab.mp3"},
    {"image": "assets/music/flu.png", "name": "Flute", "hindi": "बांसुरी", "sound": "sound/flu.mp3"},
    {"image": "assets/music/tru.png", "name": "Trumpet", "hindi": "तुरही", "sound": "sound/tru.mp3"},
    {"image": "assets/music/sax.png", "name": "Saxophone", "hindi": "सैक्सोफोन", "sound": "sound/sax.mp3"},
    {"image": "assets/music/cel.png", "name": "Cello", "hindi": "वायलनचेलो", "sound": "sound/cel.mp3"},
    {"image": "assets/music/cla.png", "name": "Clarinet", "hindi": "शहनाई", "sound": "sound/cla.mp3"},
    {"image": "assets/music/bas.png", "name": "Bass Guitar", "hindi": "बास गिटार", "sound": "sound/bas.mp3"},
    {"image": "assets/music/acc.png", "name": "Accordion", "hindi": "अकॉर्डियन", "sound": "sound/acc.mp3"},
    {"image": "assets/music/xyl.png", "name": "Xylophone", "hindi": "सिलाफ़न", "sound": "sound/xyl.mp3"},
    {"image": "assets/music/bag.png", "name": "Bagpipes", "hindi": "बैगपाइप", "sound": "sound/bag.mp3"},
    {"image": "assets/music/ele.png", "name": "Electric Guitar", "hindi": "विद्युत गिटार", "sound": "sound/ele.mp3"},
    {"image": "assets/music/har.png", "name": "Harmonica", "hindi": "अकार्डियन", "sound": "sound/har.mp3"},
    {"image": "assets/music/sit.png", "name": "Sitar", "hindi": "सितार", "sound": "sound/sit.mp3"},
    {"image": "assets/music/cym.png", "name": "Cymbals", "hindi": "झांझ", "sound": "sound/cym.mp3"},
    {"image": "assets/music/tam.png", "name": "Tambourine", "hindi": "डफ", "sound": "sound/tam.mp3"},
    {"image": "assets/music/whi.png", "name": "Whistle", "hindi": "सीटी", "sound": "sound/whi.mp3"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal Grid"),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: music.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2 // Number of columns
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
                      music[index]["image"],
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          music[index]["name"],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          music[index]["hindi"],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

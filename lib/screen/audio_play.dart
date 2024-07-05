import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlay extends StatefulWidget {
  const AudioPlay({super.key});

  @override
  State<AudioPlay> createState() => _AudioPlayState();
}

class _AudioPlayState extends State<AudioPlay> {
  late final AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Color buttonColor = Colors.red ;


  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }


  Future<void> _playAudio() async {
    try {
      await _audioPlayer.play(AssetSource('sound/Elephent.mp3'));
      setState(() {
        isPlaying = true;
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

  Future<void> _toggleAudio() async {
    if (isPlaying) {
      await _pauseAudio();
    } else {
      await _playAudio();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Audio Player")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _toggleAudio,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: isPlaying ? buttonColor : Colors.white10
              ),
              child: const Icon(Icons.volume_up_sharp,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

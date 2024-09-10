import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List<Map<String, String>> videoData = []; // To store video URL and name
  late VideoPlayerController _controller;
  bool isLoading = true;
  int currentIndex = 0; // To track the currently playing video index
  bool isVideoLoading = false; // Flag to indicate if video is still loading
  double videoPosition = 0.0; // For the slider's position

  @override
  void initState() {
    super.initState();
    fetchVideoData();
  }

  Future<void> fetchVideoData() async {
    final storageRef =
        FirebaseStorage.instance.ref().child('video/hindi_poem_video');
    final ListResult result = await storageRef.listAll();

    for (var item in result.items) {
      String videoUrl = await item.getDownloadURL();
      String videoName = item.name; // Fetch video name from Firebase
      videoData.add({'name': videoName, 'url': videoUrl});
    }

    if (videoData.isNotEmpty) {
      initializeVideoPlayer(videoData[currentIndex]['url']!);
    }
  }

  void initializeVideoPlayer(String url) {
    setState(() {
      isVideoLoading = true; // Set loading flag
    });
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {
          isLoading = false;
          isVideoLoading = false; // Set loading complete
          _controller.pause();
        });

        _controller.addListener(() {
          // Update slider position as the video plays
          setState(() {
            videoPosition = _controller.value.position.inSeconds.toDouble();
          });
        });
      });
  }

  void playNextVideo() {
    if (currentIndex < videoData.length - 1) {
      setState(() {
        currentIndex++;
        _controller.pause();
        initializeVideoPlayer(videoData[currentIndex]['url']!);
      });
    }
  }

  void playPreviousVideo() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _controller.pause();
        initializeVideoPlayer(videoData[currentIndex]['url']!);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hindi Poem Videos'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (_controller.value.isInitialized)
                  isVideoLoading
                      ? const Center(
                          child:
                              CircularProgressIndicator()) // Show loader while video is loading
                      : Column(
                          children: [
                            AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                            // Video Seek Bar (Slider)
                            Slider(
                              min: 0.0,
                              max: _controller.value.duration.inSeconds
                                  .toDouble(),
                              value: videoPosition,
                              onChanged: (newPosition) {
                                setState(() {
                                  videoPosition = newPosition;
                                  _controller.seekTo(
                                      Duration(seconds: newPosition.toInt()));
                                });
                              },
                            ),
                          ],
                        ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        "assets/images/before.png",
                        height: 40,
                        width: 40,
                      ),
                      onPressed: playPreviousVideo,
                    ),
                    IconButton(
                      icon: _controller.value.isPlaying
                          ? Image.asset(
                              "assets/images/pause.png",
                              height: 50,
                              width: 50,
                            )
                          : Image.asset(
                              "assets/images/play.png",
                              height: 50,
                              width: 50,
                            ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                    ),
                    IconButton(
                      icon: Image.asset(
                        "assets/images/next.png",
                        height: 40,
                        width: 40,
                      ),
                      onPressed: playNextVideo,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: videoData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: currentIndex == index
                            ? Colors.yellow[100]
                            : Colors.white, // Highlight the current video
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: const Icon(Icons.play_circle_fill),
                          title: Text(videoData[index][
                              'name']!), // Display the video name fetched from Firebase
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                              _controller.pause();
                              initializeVideoPlayer(videoData[index]['url']!);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

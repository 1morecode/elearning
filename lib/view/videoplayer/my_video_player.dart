//
// Created by 1 More Code on 17/05/24.
//

import 'package:chewie/chewie.dart';
import 'package:elearning/model/lecture.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final VideoModel videoModel;

  const MyVideoPlayer({super.key, required this.videoModel});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoModel.url));
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: false,
      controlsSafeAreaMinimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
      progressIndicatorDelay:
      bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
      hideControlsTimer: const Duration(seconds: 5),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: Text(widget.videoModel.title, style: const TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: _chewieController != null &&
            _chewieController!
                .videoPlayerController.value.isInitialized
            ? Chewie(
          controller: _chewieController!,
        )
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Loading'),
          ],
        ),
      ),
    );
  }
}


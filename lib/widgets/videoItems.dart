// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

class VideoItems extends StatefulWidget {
  // final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;
  final bool fullScreenDefault;
  final bool showControls;
  final double aspectRatio;

  VideoItems({
    // required this.videoPlayerController,
    required this.looping,
    required this.autoplay,
    required this.fullScreenDefault,
    required this.showControls,
    required this.aspectRatio,
    Key? key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  // late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // _chewieController = ChewieController(
    //   videoPlayerController: widget.videoPlayerController,
    //   fullScreenByDefault: widget.fullScreenDefault,
    //   showControls: widget.showControls,
    //   autoInitialize: true,
    //   allowedScreenSleep: false,
    //   aspectRatio: widget.aspectRatio,
    //   autoPlay: widget.autoplay,
    //   looping: widget.looping,
    //   errorBuilder: (context, errorMessage) {
    //     return Center(
    //       child: Text(
    //         errorMessage,
    //         style: TextStyle(color: Colors.white),
    //       ),
    //     );
    //   },
    // );
  }

  @override
  void dispose() {
    super.dispose();
    // _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // child: Chewie(
      //   controller: _chewieController,
      // ),
    );
  }
}

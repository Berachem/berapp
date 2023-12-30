import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MediaWidget extends StatefulWidget {
  final String mediaLink;

  const MediaWidget({Key? key, required this.mediaLink}) : super(key: key);

  @override
  _MediaWidgetState createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.mediaLink.contains('.mp4')) {
      _controller = VideoPlayerController.network(widget.mediaLink)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mediaLink.contains('.mp4')) {
      return _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container();
    } else {
      return Image.network(
        widget.mediaLink,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.mediaLink.contains('.mp4')) {
      _controller.dispose();
    }
  }
}

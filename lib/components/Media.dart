import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MediaWidget extends StatefulWidget {
  final String mediaLink;
  final int? width;

  const MediaWidget({Key? key, required this.mediaLink, this.width})
      : super(key: key);

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
          ? Container(
              width: widget.width != null ? widget.width!.toDouble() : null,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
          : Container();
    } else {
      return Image.network(
        widget.mediaLink,
        fit : BoxFit.cover,
        width: widget.width != null ? widget.width!.toDouble() : null,
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer(
      {required this.video, required this.onNewVideoPressed, super.key});

  final PickedFile video;
  final VoidCallback onNewVideoPressed;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoPlayerController;
  Duration currentPosition = const Duration();
  bool isShowControls = false;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.file(File(widget.video.path));

    _initController();
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.video.path != widget.video.path) {
      _initController();
    }
  }

  void _initController() async {
    currentPosition = const Duration();

    await videoPlayerController!.initialize();

    videoPlayerController!.addListener(() async {
      final currentPosition = await videoPlayerController!.position;

      setState(() {
        this.currentPosition = currentPosition!;
      });
    });

    setState(() {});
  }

  void _onReversePressed() async {
    final currentPosition = await videoPlayerController!.position;

    Duration position = const Duration();
    if (currentPosition!.inSeconds > 3) {
      position = currentPosition - const Duration(seconds: 3);
    }

    videoPlayerController!.seekTo(position);
  }

  void _onPlayPressed() {
    // 이미 실행 중이면 정지, 아니면 실행
    if (videoPlayerController!.value.isPlaying) {
      videoPlayerController!.pause();
    } else {
      videoPlayerController!.play();
    }
    setState(() {});
  }

  void _onForwardPressed() async {
    final maxPosition = videoPlayerController!.value.duration;
    final currentPosition = await videoPlayerController!.position;

    Duration position = const Duration();
    if ((maxPosition - const Duration(seconds: 3)).inSeconds >
        currentPosition!.inSeconds) {
      position = currentPosition + const Duration(seconds: 3);
    }

    videoPlayerController!.seekTo(position);
  }

  void _onNewVideoPressed() {}

  void _onSliderChanged(double value) {
    videoPlayerController!.seekTo(Duration(seconds: value.toInt()));
  }

  @override
  Widget build(BuildContext context) {
    if (videoPlayerController == null) {
      return const CircularProgressIndicator();
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowControls = !isShowControls;
        });
      },
      child: Stack(children: [
        AspectRatio(
            aspectRatio: videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(videoPlayerController!)),
        if (isShowControls)
          _Controls(
            onReversePressed: _onReversePressed,
            onPlayPressed: _onPlayPressed,
            onForwardPressed: _onForwardPressed,
            isPlaying: videoPlayerController!.value.isPlaying,
          ),
        if (isShowControls)
          _NewVideo(
            onPressed: _onNewVideoPressed,
          ),
        _Slider(
            currentPosition: currentPosition,
            maxCount: videoPlayerController!.value.duration,
            onChanged: _onSliderChanged),
      ]),
    );
  }
}

class _NewVideo extends StatelessWidget {
  const _NewVideo({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 0,
        child: IconButton(
            iconSize: 30,
            onPressed: onPressed,
            icon: const Icon(Icons.photo_camera_back, color: Colors.white)));
  }
}

class _Controls extends StatelessWidget {
  const _Controls({
    required this.onReversePressed,
    required this.onPlayPressed,
    required this.onForwardPressed,
    required this.isPlaying,
    Key? key,
  }) : super(key: key);

  final VoidCallback onReversePressed;
  final VoidCallback onPlayPressed;
  final VoidCallback onForwardPressed;
  final bool isPlaying;

  Widget _buildIconButton(
      {required VoidCallback onPressed, required IconData iconData}) {
    return IconButton(
        iconSize: 30,
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: Colors.white,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      height: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(
              onPressed: onReversePressed, iconData: Icons.rotate_left),
          _buildIconButton(
              onPressed: onPlayPressed,
              iconData: isPlaying ? Icons.pause : Icons.play_arrow),
          _buildIconButton(
              onPressed: onForwardPressed, iconData: Icons.rotate_right)
        ],
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  const _Slider(
      {required this.currentPosition,
      required this.maxCount,
      required this.onChanged,
      super.key});

  final Duration currentPosition;
  final Duration maxCount;
  final Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Row(
        children: [
          Text(
            '${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, "0")}',
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Slider(
                max: maxCount.inSeconds.toDouble(),
                min: 0,
                value: currentPosition.inSeconds.toDouble(),
                onChanged: onChanged),
          ),
          Text(
            '${maxCount.inMinutes}:${(maxCount.inSeconds % 60).toString().padLeft(2, "0")}',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vid_player/component/custom_video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PickedFile? video;

  void _onLogoTap() async {
    final selectedVideo =
        await ImagePicker.platform.pickVideo(source: ImageSource.gallery);

    if (selectedVideo != null) {
      setState(() {
        video = selectedVideo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.w300);

    return Scaffold(
      body: video == null
          ? _BodyEmpty(
              textStyle: textStyle,
              onTap: _onLogoTap,
            )
          : CustomVideoPlayer(video: video!, onNewVideoPressed: _onLogoTap,),
    );
  }
}

class _BodyEmpty extends StatelessWidget {
  const _BodyEmpty({
    Key? key,
    required this.textStyle,
    required this.onTap,
  }) : super(key: key);

  final TextStyle textStyle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2A3A7C), Color(0xFF000118)])),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
            onTap: onTap, child: Image.asset('assets/images/logo.png')),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'VIDEO',
              style: textStyle,
            ),
            Text(
              'PLAYER',
              style: textStyle.copyWith(fontWeight: FontWeight.w700),
            )
          ],
        )
      ]),
    );
  }
}

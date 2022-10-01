import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_carousel/screen/home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const HomeScreen(),
    scrollBehavior: const MaterialScrollBehavior()
        .copyWith(dragDevices: {PointerDeviceKind.mouse}),
  ));
}

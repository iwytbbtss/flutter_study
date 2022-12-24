import 'package:flutter/material.dart';
import 'package:navigator/screen/home_screen.dart';
import 'package:navigator/screen/route_one.dart';
import 'package:navigator/screen/route_three.dart';
import 'package:navigator/screen/route_two.dart';

void main() {
  runApp(MaterialApp(
    // home: HomeScreen(),
    initialRoute: '/',
    routes: {
      '/': (context) => HomeScreen(),
      '/one': (context) => RouteOne(),
      '/two': (context) => RouteTwo(),
      '/three': (context) => RouteThree()
    },
  ));
}

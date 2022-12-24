import 'package:flutter/material.dart';
import 'package:navigator/layout/main_layout.dart';

class RouteThree extends StatelessWidget {
  const RouteThree({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;

    return MainLayOut(title: 'RouteThree', children: [
      Text('$argument', textAlign: TextAlign.center,),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'))
    ]);
  }
}

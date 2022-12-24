import 'package:flutter/material.dart';
import 'package:navigator/layout/main_layout.dart';
import 'package:navigator/screen/route_two.dart';

class RouteOne extends StatelessWidget {
  final int? number;
  const RouteOne({this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayOut(title: 'RouteOne', children: [
      Text(
        number.toString(),
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Pop')),
      ElevatedButton(
          onPressed: () {
            final result = Navigator.push(
                context, MaterialPageRoute(builder: ((context) => RouteTwo()), settings: RouteSettings(arguments: 789)));
          },
          child: Text('Push')),
    ]);
  }
}

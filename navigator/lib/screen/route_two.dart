import 'package:flutter/material.dart';
import 'package:navigator/layout/main_layout.dart';

class RouteTwo extends StatelessWidget {
  const RouteTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return MainLayOut(title: 'RouteTwo', children: [
      Text(
        'arguments: ${arguments.toString()}',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Pop')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 'to three');
          },
          child: Text('Push Named')),
      ElevatedButton(
          onPressed: () {
            // Get.off()
            Navigator.of(context).pushReplacementNamed('/three');
          },
          child: Text('Push Replacement')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/three', (route) => route.settings.name == '/');
          },
          child: Text('Push And RemoveUntile'))
    ]);
  }
}

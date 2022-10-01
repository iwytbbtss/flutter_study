import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigoAccent,
        body: Center(
          child: Text('Hello Flutter', style: TextStyle(
            color: Colors.amberAccent,
            fontSize: 20.0
          ),),
        ),
      ),
    )
  );
}

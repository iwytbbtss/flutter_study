import 'package:flutter/material.dart';

class RowNumber extends StatelessWidget {
  final int number;
  const RowNumber({required this.number,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: number
          .toString()
          .split('')
          .map((number) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Image.asset(
                  'assets/$number.png',
                  width: 50,
                  height: 70,
                ),
              ))
          .toList(),
    );
    ;
  }
}

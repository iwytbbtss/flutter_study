import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number_generator/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> randomNumbers = [];

  void randomNumberGenerate() {
    final rand = Random();
    final Set<int> newNumbers = {};

    while (newNumbers.length < 3) {
      final temp = rand.nextInt(10000);
      newNumbers.add(temp);
    }

    randomNumbers = newNumbers.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Header(),
            _Body(randomNumbers: randomNumbers),
            _Footer(onPressed: randomNumberGenerate)
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '랜덤숫자 생성기',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
        ),
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: redColor,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  final List<int> randomNumbers;
  const _Body({required this.randomNumbers, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: randomNumbers.map(_rowNumbers).toList(),
    ));
  }

  Row _rowNumbers(int rowNumber) {
    return Row(
      children: rowNumber
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
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;
  const _Footer({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: redColor),
            onPressed: onPressed,
            child: const Text('생성하기!')));
  }
}

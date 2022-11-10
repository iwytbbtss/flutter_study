import 'package:flutter/material.dart';
import 'package:random_number_generator/component/row_number.dart';
import 'package:random_number_generator/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final int maxNumber;
  const SettingsScreen({required this.maxNumber, super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late double maxNumber;

  @override
  void initState() {
    super.initState();

    maxNumber = widget.maxNumber.toDouble();
  }

  void onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }

  void onBottomBarPressed() {
    Navigator.of(context).pop(maxNumber.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _Body(maxNumber: maxNumber),
            _Footer(
              maxNumber: maxNumber,
              onChanged: onSliderChanged,
              onBottomBarPressed: onBottomBarPressed,
            )
          ],
        ),
      )),
    );
  }
}

class _Body extends StatelessWidget {
  final double maxNumber;
  const _Body({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RowNumber(number: maxNumber.toInt(),)
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final void Function(double) onChanged;
  final VoidCallback onBottomBarPressed;
  const _Footer(
      {required this.maxNumber,
      required this.onChanged,
      required this.onBottomBarPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(
            value: maxNumber, min: 10000, max: 1000000, onChanged: onChanged),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: redColor),
            onPressed: onBottomBarPressed,
            child: const Text('저장!'))
      ],
    );
  }
}

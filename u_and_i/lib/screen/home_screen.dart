import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                _TopPart(
                  selectedDate: selectedDate,
                  now: now,
                  onChanged: () {
                    showCupertinoDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.white,
                              height: 300,
                              child: CupertinoDatePicker(
                                initialDateTime: selectedDate,
                                maximumDate: now,
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: (value) {
                                  setState(() {
                                    selectedDate = value;
                                  });
                                },
                              ),
                            ),
                          );
                        });
                  },
                ),
                Expanded(
                  child: Image.asset(
                    'assets/image/middle_image.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final DateTime now;
  final VoidCallback onChanged;

  const _TopPart(
      {required this.selectedDate,
      required this.now,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난날',
                style: textTheme.bodyText1,
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyText2,
              ),
            ],
          ),
          IconButton(
            onPressed: onChanged,
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            iconSize: 60,
          ),
          Text(
            'D+${DateTime(now.year, now.month, now.day).difference(selectedDate).inDays + 1}',
            style: textTheme.headline2,
          )
        ],
      ),
    );
  }
}

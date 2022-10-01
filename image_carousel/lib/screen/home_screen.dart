import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }
      controller.animateToPage(nextPage,
          duration: const Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 시계, 배터리 등등 상단바 테마
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: PageView(
          controller: controller,
          children: [1, 2, 3, 4, 5]
              .map((e) => Image.asset(
                    'assets/img/image_$e.jpeg',
                    fit: BoxFit.cover,
                  ))
              .toList()),
    );
  }
}

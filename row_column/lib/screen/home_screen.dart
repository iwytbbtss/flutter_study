import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // 안드로이드,  아이폰 상단, 하단 영역 안겹치게
        bottom: false,
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisAlignment - 주축 정렬
            // spaceBetween: 위젯과 위젯의 사이가 동일하게
            // spaceEvenly: 위젯을 같은 간격으로, 끝과 끝에도 빈 간격
            // spaceAround: spaceEvenly+끝과 끝은 반
            crossAxisAlignment: CrossAxisAlignment.start,
            // crossAxisAlignment: 보조축 정렬
            // stretch: child와 상관없이 끝까지 늘림
            mainAxisSize: MainAxisSize.max,
            // mainAxisSize - 주축 크기
            children: [
              // Expanded / Flexible : Row, Column 에서만!
              Flexible(
                child: Container(
                  color: Colors.red,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                flex: 2, // default: 1
                child: Container(
                  color: Colors.orange,
                  width: 50,
                  height: 50,
                ),
              ),
              Container(
                color: Colors.yellow,
                width: 50,
                height: 50,
              ),
              Container(
                color: Colors.green,
                width: 50,
                height: 50,
              ),
            ],
          ),
        ),
      )
    );
  }
}
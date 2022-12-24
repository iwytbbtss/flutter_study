import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('버튼 정리')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green.shade200),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      // MaterialState
                      //
                      // hovered - 마우스 호버 상태
                      // focused - 포커스 된 상태
                      // pressed - 눌렀을 때
                      // dragged - 드래그 됐을 때
                      // selected - 선택 됐을 때
                      // scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을 때
                      // disabled - 비활성화 됐을 때
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return Colors.black;
                    }),
                    padding: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const EdgeInsets.all(48);
                      }
                      return const EdgeInsets.all(8);
                    })),
                child: const Text('ButtonStyle'),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.black,
                    shadowColor: Colors.green,
                    elevation: 10,
                    textStyle:
                        const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    padding: const EdgeInsets.all(20),
                    side: const BorderSide(color: Colors.black, width: 2),
                    shape: const StadiumBorder()),
                child: const Text('ElevatedButton'),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    elevation: 10,
                    padding: const EdgeInsets.all(20)),
                child: const Text('OutLinedButton'),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.orange),
                child: const Text('TextButton'),
              )
            ]),
      ),
    );
  }
}

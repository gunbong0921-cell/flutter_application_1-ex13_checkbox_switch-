import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/**
플러터에서는 HTML과는 다르게 객체에 직접 이름을 주고 값을 구해오는 방식이 아닌 객첵가 변화할때마다 
변수에 변화된 값을 저장하는 방식으로 사용한다. 즉 객체의 상태와 변수의 값을 동기화 하는 방식으로 구현한다. 
 */
class _MyHomePageState extends State<MyHomePage> {
  // 체크박스와 스위치에서 사용할 변수 생성
  bool _chk1 = false;
  // Nullable로 선언. 즉 null값을 허용하는 변수.
  bool? _chk2 = false;
  bool _chk3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 체크박스1
            Checkbox(
              // 체크박스에서 사용할 값 지정
              value: _chk1,
              // 체크 or 언체크 시 이벤트 감지
              onChanged: (bool? value) {
                // 변수의 값을 변경하면서 리렌더링 된다.
                setState(() {
                  /**
                  null check operator : 변수뒤에 !를 추가하면 실행시 변수가 null인 경우
                  런타임에러를 발생시킨다. 
                   */
                  _chk1 = value!;
                });
                print('Checkbox 1: $_chk1');
              },
            ),
            // 체크박스2
            Checkbox(
              value: _chk2,
              checkColor: Colors.pink, // 체크되었을 때 마크의 색
              activeColor: Colors.green, // 체크되었을때 배경색
              // _chk2는 Nullable로 선언되었으므로 별도의 처리 필요없음
              // 노멀 상태의 배경색은 테마로 변경
              onChanged: (value) {
                setState(() {
                  _chk2 = value;
                });
                print('Checkbox 2: $_chk2');
              },
            ),
            Switch(
              value: _chk3,
              // 스위치가 켜졌을때 색깔
              activeThumbColor: Colors.red,
              activeTrackColor: Colors.cyan,
              // 스위치가 꺼졌을때 색깔
              inactiveThumbColor: Colors.lightGreen,
              inactiveTrackColor: Colors.lightGreen,
              onChanged: (value) {
                setState(() {
                  _chk3 = value;
                });
                print('Checkbox 3: $_chk3');
              },
            ),
          ],
        ),
      ),
    );
  }
}

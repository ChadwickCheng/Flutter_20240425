import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show debugPrintGestureArenaDiagnostics;
import './Widget/swiper.dart';
import './PageViewKeepAlive.dart';

void main() {
  debugPrintGestureArenaDiagnostics = false;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageViewlog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('PageViewlog Demo'),
          backgroundColor: Colors.blue,
        ),
        body: KeepAlivePage(),
      ),
    );
  }
}

// 无限轮播图
class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}
class _PageViewDemoState extends State<PageViewDemo> {

  List<String> list = [];
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      'images/nero.png',
      'images/nero.png',
      'images/nero.png',
    ];
    // 定时器
    // Timer tid = Timer.periodic(Duration(seconds: 3), (timer) {
    //   print('timer');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Swiper(list: list),
      ],
    );
  }
}
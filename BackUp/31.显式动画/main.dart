import 'package:flutter/material.dart';

void main(){
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
      home: AnimeDemo(),
    );
  }
}

class AnimeDemo extends StatefulWidget {
  const AnimeDemo({super.key});

  @override
  State<AnimeDemo> createState() => _AnimeDemoState();
}

class _AnimeDemoState extends State<AnimeDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 实质是一个动画控制器 .value 0-1之间的值
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      lowerBound: 0.5, // 动画的最小值
      upperBound: 1.0, // 动画的最大值
      vsync: this // 程序与手机屏幕的刷新频率同步
    );
    // ..repeat(); // 重复执行动画 连缀操作符
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anime Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
            _controller.repeat(
              reverse: true // 反向执行动画
            );
            // _controller.drive(Tween(begin: 0.5, end: 1.0)); // 重新设置动画的范围
            // _controller.forward();
            // _controller.stop();
          },
        ),
        body: 
        // 隐式动画已经封装好了，开箱即用
        // 显式动画需要自己实现
        Center(
          child: Column(
            children: [
              // 旋转动画
              RotationTransition(
                turns: _controller,
                child: FlutterLogo(
                  size: 60
                ),
              ),
              SizedBox(height: 40),
              // 变淡动画
              FadeTransition(
                opacity: _controller,
                child: FlutterLogo(
                  size: 60
                ),
              ),
              // 缩放动画
              ScaleTransition(
                scale: _controller,
                child: FlutterLogo(
                  size: 60
                ),
              ),
              // 平移动画
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, 0),
                  end: Offset(1, 1)
                )
                .chain(
                  CurveTween(curve: Curves.easeInOut) // 动画曲线
                )
                .chain(
                  CurveTween(curve: const Interval(0.2, 0.8)) // 连续chain 交错动画 当前时间点.2-.8之间的动画
                )
                .animate(_controller),
                child: FlutterLogo(
                  size: 60
                ),
              )
            ]
          )
        )
      ),
    );
  }
}
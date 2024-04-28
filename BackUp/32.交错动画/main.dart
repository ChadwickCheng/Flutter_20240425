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
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // 动画icon 由一个icon变成另一个icon
  // 缺点 原生没提供很多icon 需要自己定义交错式动画(通过显式动画)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anime Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(_controller.isCompleted){
              _controller.reverse();
            }else{
              _controller.forward();
            }
          },
          child: Icon(Icons.refresh),
        ),
        body: 
        // 原生提供的动画icon
        // AnimatedIcon(
        //   icon: AnimatedIcons.menu_arrow,
        //   progress: _controller,
        //   size: 40,
        // )

        // 自己实现动画icon
        // 0-0.5 search消失 0.5-1 close出现
        // Center(
        //   child: Stack(
        //     children: [
        //       ScaleTransition(
        //         scale: _controller.drive(Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve:Interval(0.5, 1)))),
        //         child: Icon(Icons.close, size:40),
        //       ),
        //       ScaleTransition(
        //         scale: _controller.drive(Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve:Interval(0, 0.5)))),
        //         child: Icon(Icons.search, size:40),
        //       )
        //     ],
        //   ),
        // )

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideBox(controller: _controller, color: Colors.red[300], curve: Interval(0, 0.3)),
              SlideBox(controller: _controller, color: Colors.green[500], curve: Interval(0.2, 0.6)),
              SlideBox(controller: _controller, color: Colors.blue[700], curve: Interval(0.5, 0.8)),
            ],
          )
        )
      ),
    );
  }
}

class SlideBox extends StatelessWidget {
  final AnimationController controller;
  final Color? color;
  final Curve curve;
  const SlideBox({super.key, required this.controller, required this.color, required this.curve});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.drive(
        Tween<Offset>(
          begin: Offset(0, 0),
          end: Offset(1, 0)
        ).chain(CurveTween(curve: curve))
      ),
      child: Container(
        width: 120,
        height: 60,
        color: color,
      )
    );
  }
}
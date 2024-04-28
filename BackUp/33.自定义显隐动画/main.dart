import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  // bool flag = true;

  // 1. contro
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this
    );
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
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //     setState(() {
        //       flag = !flag;
        //     });
        //   },
        //   child: Icon(Icons.play_arrow),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _controller.repeat(reverse: true);
          },
          child: Icon(Icons.play_arrow),
        ),
        body: 
          Center(
            // Tween的end改变时执行动画
            // child: TweenAnimationBuilder(
            //   tween: Tween(begin: 60.0, end: flag?60.0:200.0),
            //   duration: Duration(seconds: 1),
            //   builder:((context, value, child){
            //     return Icon(Icons.start,size: value as double);
            //   })
            // )

            // 透明度
            // child: TweenAnimationBuilder(
            //   tween: Tween(begin: 0.5, end: flag?0.5:1.0),
            //   duration: Duration(seconds: 1),
            //   builder:((context, value, child){
            //     return Opacity(
            //       opacity: value,
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         color: Colors.red,
            //       )
            //     );
            //   })
            // )

            // 自定义显式动画 透明度
            // child: AnimatedBuilder(
            //   animation: _controller,
            //   builder: (context, child){
            //     return Opacity(
            //       // opacity: 1,
            //       opacity: Tween(begin: 0.5, end: 1.0).animate(_controller).value,
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         color: Colors.red,
            //       ),
            //     );
            //   }
            // )

            // 自定义显式动画 位移
            // 注意 AnimatedBuilder 的 builder 函数在动画的每一帧都会被调用。这意味着如果你在 builder 函数中调用了一个函数，那么这个函数在动画执行期间会被反复执行。
            // 这也是我们需要child参数的原因，如果我们不需要在动画执行期间反复创建这个widget，我们可以将这个widget作为child传入AnimatedBuilder。
            child: AnimatedBuilder(
              animation: _controller,
              child:Column(
                children: [
                  Text('Hello'),
                  Text('World'),
                ],
              ),
              builder: (context, child){
                return Transform.translate(
                  offset: Offset(0, Tween(begin: 0.0, end: 100.0)
                  .chain(CurveTween(curve: Curves.bounceInOut))
                  .chain(CurveTween(curve: Interval(0.2,0.8)))
                  .animate(_controller).value),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                    child: child
                  ),
                );
              }
            )
          )
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

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

class _AnimeDemoState extends State<AnimeDemo> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Anime Demo'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              flag = !flag;
            });
          },
        ),
        body: 
        // 初识
        // Center(
        //   child: AnimatedContainer(
        //     duration: Duration(seconds: 1), // 动画持续时间
        //     width: flag?200:300,
        //     height: flag?200:300,
        //     color: Colors.red,
        //     transform: flag?Matrix4.rotationZ(0.25):Matrix4.rotationZ(0),
        //   ),
        // ),

        // DIY一个抽屉
        // Stack(
        //   children: [
        //     ListView(
        //       children: [
        //         ListTile(
        //           title: Text('1'),
        //         ),
        //       ]
        //     ),
        //     Positioned(
        //       left: 0,
        //       top: 0,
        //       bottom: 0,
        //       child: AnimatedContainer(
        //         duration: Duration(seconds: 1),
        //         width: 200,
        //         height: double.infinity,
        //         transform: flag?
        //         Matrix4.translationValues(-200, 0, 0):
        //         Matrix4.translationValues(0, 0, 0),
        //         color: Colors.red,
        //       ),
        //     )
        //   ]
        // )

        // padding
        // AnimatedPadding(
        //   curve: Curves.bounceInOut, // 默认线性
        //   duration: Duration(seconds: 1),
        //   padding: flag
        //   ? EdgeInsets.fromLTRB(10, 100, 0, 0)
        //   :EdgeInsets.fromLTRB(10, 400, 0, 0),
        //   child: Container(
        //     width: 100,
        //     height: 100,
        //     color: Colors.red,
        //   ),
        // ),

        // opacity
        // AnimatedOpacity(
        //   duration: Duration(seconds: 1),
        //   opacity: flag?1:0,
        //   child: Container(
        //     width: 100,
        //     height: 100,
        //     color: Colors.red,
        //   ),
        // ),

        // Positioned
        // Stack(
        //   children: [
        //     AnimatedPositioned(
        //       duration: Duration(seconds: 1),
        //       left: flag?0:100,
        //       top: flag?0:100,
        //       child: Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.red,
        //       ),
        //     ),
        //   ]
        // )

        // Text
        // AnimatedDefaultTextStyle(
        //   duration: Duration(seconds: 1),
        //   style: flag
        //   ? TextStyle(
        //     color: Colors.red,
        //     fontSize: 20,
        //   )
        //   : TextStyle(
        //     color: Colors.blue,
        //     fontSize: 30,
        //   ),
        //   child: Text('Hello World'),
        // ),

        // switcher 之前都是属性改变时执行 switcher是在子元素改变时执行 loading转为图片
        Center(
          child: Container(
            alignment: Alignment.center,
            width: 300,
            height: 300,
            color: Colors.red,
            // child: flag ? const CircularProgressIndicator() : Image.asset('images/nero.png'),
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  // child: child, // 可以动画叠加
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  )
                );
              },// 改变动画效果 默认淡入淡出
              duration: Duration(seconds: 1),
              // child: flag ? const CircularProgressIndicator() : Image.asset('images/nero.png'),
              // 文字默认不拥有key，所以会被认为是同一个widget，所以不会执行动画，所以需要给Text添加key
              child: Text(
                key: UniqueKey(),
                flag ? 'Hello World' : 'Hello Flutter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            )
          )
        )
      ),
    );
  }
}
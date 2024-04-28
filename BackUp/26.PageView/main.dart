import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show debugPrintGestureArenaDiagnostics;

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
        body: PageViewDemo(),
      ),
    );
  }
}

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({super.key});

  @override
  State<PageViewDemo> createState() => _PageViewDemoState();
}

// 初识PageView
// class _PageViewDemoState extends State<PageViewDemo> {

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       scrollDirection: Axis.horizontal, // 水平滚动
//       children: [ // children内的每个child都是一个屏幕
//         Center(
//           child: Text(
//             '第一屏',
//             style: Theme.of(context).textTheme.headlineMedium,
//           )
//         ),
//         Center(
//           child: Text(
//             '第二屏',
//             style: Theme.of(context).textTheme.headlineMedium,
//           )
//         ),
//         Center(
//           child: Text(
//             '第三屏',
//             style: Theme.of(context).textTheme.headlineMedium,
//           )
//         ),
//       ]
//     );
//   }
// }

// PageViewBuilder动态构建 类似于ListView.builder
// class _PageViewDemoState extends State<PageViewDemo> {

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       scrollDirection: Axis.horizontal, // 水平滚动
//       itemCount: 3, // 页面数量
//       itemBuilder: (BuildContext context, int index) {
//         return Center(
//           child: Text(
//             '第${index + 1}屏',
//             style: Theme.of(context).textTheme.headlineMedium,
//           )
//         );
//       }
//     );
//   }
// }

// 上拉无限加载更多
// class _PageViewDemoState extends State<PageViewDemo> {
//   List<Widget> list = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     for(var i=0;i < 10; i++){
//       list.add(
//         Center(
//           child: Text(
//             '第${i + 1}屏',
//             style: TextStyle(
//               fontSize: 60,
//             ),
//           )
//         )
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       scrollDirection: Axis.vertical,
//       onPageChanged: (idx){ // 接受一个当前页面索引值，从0开始
//         if(idx+2 == list.length){
//           for(var i=0;i < 10; i++){
//             list.add(
//               Center(
//                 child: Text(
//                   '第${list.length + 1}屏',
//                   style: TextStyle(
//                     fontSize: 60,
//                   ),
//                 )
//               )
//             );
//           }
//           setState(() {
//             list = list;
//           });
//         }
//       },
//       children: list,
//     );
//   }
// }

// 轮播图
class _PageViewDemoState extends State<PageViewDemo> {

  List<Widget> list = [];
  int _curPageIdx = 0; // 用于指示器样式判断

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      ImagePage(),
      ImagePage(),
      ImagePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container( // pageview默认会占满屏幕，所以需要一个容器包裹
          height: 200,
          child: PageView.builder(
            onPageChanged: (idx) => setState(() => _curPageIdx = idx%list.length),
            itemCount: 1000, // 实现无限轮播
            itemBuilder: (BuildContext context, int index) {
              return list[index % 3];
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0, // l0r0占满整行
          bottom: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(list.length, (idx){
              return Container(
                margin: EdgeInsets.all(5),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: idx == _curPageIdx ? Colors.red : Colors.grey,
                  shape: BoxShape.circle,
                ),
              );
            }).toList()
          )
        )
      ],
    );
  }
}

class ImagePage extends StatelessWidget {
  final double width;
  final double height;
  final String src = 'images/nero.png';

  ImagePage({super.key, this.width=double.infinity, this.height=200});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image.asset(src, fit: BoxFit.cover,),
    );
  }
}
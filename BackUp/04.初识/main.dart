import 'package:flutter/material.dart'; // importM

// 1. 静态组件加const 可以提高性能; 由于const是全部不变，所以子元素不用再加const
// 2. MaterialApp根组件，包含了一些全局配置，如主题、语言、路由等；Scaffold是页面的基本布局结构，包含appBar、body、bottomNavigationBar等

// 3. 初识
// void main() {
//   runApp(const Center(
//     child: Text(
//       'Hello, world!', 
//       textDirection: TextDirection.ltr,
//       style: TextStyle(
//         // color: Colors.blue,
//         color: Color.fromRGBO(124, 244, 244, 50),
//         fontSize: 30,
//       )
//     ),
//   ));
// }

// 4. M S
// void main(){
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Tutti.fan'),
//       ),
//       body: const Center(
//         child: Text('Welcome to Tutti.fan!'),
//       ),
//     )
//   ));
// }

// 5. 抽离
void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tutti.fan'),
        ),
        body: const MyApp(),
      )
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome to Tutti.fan!'),
    );
  }
}
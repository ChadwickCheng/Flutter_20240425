import 'package:flutter/material.dart';
import './font.dart';

/*
使用阿里云图标库
1. fonts存储对应的json和ttf
2. pubspec.yaml中配置
3. 创建一个dart文件，定义一个类，用于存储图标
4. 导入这个dart文件并使用
*/

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.yellow,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Tutti.fan'),
      ),
      body: const Column(
        children: <Widget>[
          MyIcon(),
          Icon(
            ChengFont.more,
            color: Colors.red,
            size: 100.0,
          )
        ]
      ),
    ),
  ));
}

class MyIcon extends StatelessWidget {
  const MyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        )
      ),
      child: const Icon(
        Icons.stay_primary_landscape_sharp,
        color: Colors.yellow,
        size: 100.0,
      )
    );
  }
}
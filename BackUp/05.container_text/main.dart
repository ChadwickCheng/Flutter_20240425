import 'package:flutter/material.dart';

// 1. container 类似于 div 标签，用于包裹其他组件

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Tutti.fan'),
      ),
      body: const Column(
        children: [
          MyApp(),
          MyButton(),
          SizedBox(height: 20.0,),
          MyText(),
        ],
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center, // 子元素位置
        width: 200.0,
        height: 200.0,
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 20), // 外边距
        padding: const EdgeInsets.all(10.0), // 内边距
        decoration: BoxDecoration(
          color: Colors.blue, // 背景颜色
          border: Border.all(
            color: Colors.red, // 边框颜色
            width: 2.0, // 边框宽度
          ),
          borderRadius: BorderRadius.circular(10.0), // 边框圆角
          boxShadow: const [
            BoxShadow(
              color: Colors.black, // 阴影颜色
              offset: Offset(5.0, 5.0), // 阴影偏移
              blurRadius: 5.0, // 阴影模糊程度
            ),
          ],
          gradient: const LinearGradient(
            colors: [Colors.red, Colors.blue], // 渐变颜色
            begin: Alignment.topLeft, // 渐变起始位置
            end: Alignment.bottomRight, // 渐变结束位置
          ),
        ),
        // transform: Matrix4.rotationZ(0.1), // 旋转
        // transform: Matrix4.skewX(0.1), // 倾斜
        transform: Matrix4.translationValues(10.0, 10.0, 0.0), // 平移
        child: const Text(
          'Twinkle twinkle little white snow',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      )
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Text(
        'Click Me',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      )
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Text(
        'Twinkle twinkle little white snow',
        textAlign: TextAlign.center, // 文本对齐方式
        overflow: TextOverflow.ellipsis, // 文本溢出处理 ellipsis 省略号
        maxLines: 2, // 最大行数
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.white,
          fontWeight: FontWeight.bold, // 文本粗细
          fontStyle: FontStyle.italic, // 文本样式
          letterSpacing: 2.0, // 字符间距
          wordSpacing: 10.0, // 单词间距
          decoration: TextDecoration.lineThrough, // 文本装饰
          decorationColor: Colors.red, // 装饰线颜色
          decorationStyle: TextDecorationStyle.dashed, // 装饰线样式
        ),
      ),
    );
  }
}
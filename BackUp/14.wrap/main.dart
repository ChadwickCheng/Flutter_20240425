import 'package:flutter/material.dart';

// wrap组件实现流布局 一行wrap和一行row没啥区别
// 经典实现就是搜索框下的热门搜索标签

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.yellow,
    ),
    title: 'Tutti.fan!',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Tutti.fan!'),
      ),
      body: WrapD(),
    ),
  ));
}

class WrapD extends StatelessWidget {
  

  const WrapD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 8, // 水平间距
        runSpacing: 4, // 垂直间距
        direction: Axis.horizontal, // 主轴方向
        alignment: WrapAlignment.start, // 主轴对齐方式
        children: [
          MyButton(
            text: 'wrap',
            onPressed: () {
              print('wrap');
            },
          ),
          MyButton(
            text: 'wrap123123',
            onPressed: () {
              print('wrap');
            },
          ),
          MyButton(
            text: 'wrap42352',
            onPressed: () {
              print('wrap');
            },
          ),
          MyButton(
            text: 'wrap123123',
            onPressed: () {
              print('wrap');
            },
          ),
          MyButton(
            text: 'wrap42352',
            onPressed: () {
              print('wrap');
            },
          ),
        ],
      ), 
    );
  }
}

// 自定义按钮
class MyButton extends StatelessWidget {
  String? text;
  void Function()? onPressed;
  MyButton({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text ?? '按钮', style: Theme.of(context).textTheme.titleLarge),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.pink),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      )
    );
  }
}
import 'package:flutter/material.dart';

// 常用布局组件
// 1. padding属性 或者 Padding组件
// 2. 水平布局Row 竖直布局Column
// 如何撑满父组件的宽高? double.infinity double.maxFinite
// 3. Expanded的flex属性 Flex组件; 由于Row和Column都是继承自Flex，实现flex布局可以使用Expanded+Row/Column 或者 Expanded+Flex; Expanded必须用在继承自Flex的组件中 Expanded设置宽高无效
// 建议flex布局的内容使用container包裹，从而指定宽高


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
      body: const HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('this is padding widget'),
        ),
        Row( // xaxis自适应 yaxis撑满，设置yaxis需要依赖于父组件
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴对齐方式 类似于flex布局的justify-content中的space-around
          // crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴对齐方式 类似于flex布局的align-items
          children: <Widget>[
            IconContainer(),
            IconContainer(color: Colors.blue,),
            IconContainer(color: Colors.black, icon: Icons.home,),
          ]
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 主轴对齐方式
          crossAxisAlignment: CrossAxisAlignment.start, // 交叉轴对齐方式
          children: <Widget>[
            IconContainer(),
            IconContainer(color: Colors.blue,),
            IconContainer(color: Colors.black, icon: Icons.home,),
          ]
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: IconContainer(color: Colors.red, icon: Icons.home),
            ),
            Expanded(
              flex: 2,
              child: IconContainer(color: Colors.blue, icon: Icons.pets),
            ),
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: IconContainer(color: Colors.red, icon: Icons.home),
            ),
            Expanded(
              flex: 2,
              child: IconContainer(color: Colors.blue, icon: Icons.pets),
            ),
          ],
        ),
      ]
    );
  }
}

class IconContainer extends StatelessWidget {
  Color? color;
  IconData? icon;
  // const IconContainer({super.key});
  IconContainer({Key? key, this.color, this.icon}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      color: color ?? Colors.red,
      alignment: Alignment.center,
      child: Icon(icon ?? Icons.pets, color: Colors.white, size: 32),
    );
  }
}
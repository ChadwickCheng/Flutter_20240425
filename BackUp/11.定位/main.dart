import 'package:flutter/material.dart';

// 定位
// 1. Stack 层叠 数组后一个元素堆叠到前一个元素上 类似于z-index
// 2. Stack+Positioned 定位
// Positioned 组件在 Flutter 中用于相对于其最近的 Stack 组件进行定位。如果 Positioned 组件没有包含在 Stack 组件中，那么它将无法正确工作。Positioned 组件的 top、right、bottom 和 left 属性都是相对于 Stack 组件的。效果类似于css的子绝父相
// pos或pos内的组件要有宽高，否则无法显示。最佳实践是使用pos就设置宽高
// double.infinite主要用于container；pos需要获取屏幕宽高

// alignment属性 或 Align组件
// Align+Container Align+Stack
// Center组件是Align组件的一个特例，它会将子组件放置在容器的中心位置


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
      body: const AlignD(),
    ),
  ));
}

// Stack初识
class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // 居中堆叠
      children: [
        Container(
          height: 400,
          width: 300,
          color: Colors.red,
        ),
        Container(
          height: 300,
          width: 200,
          color: Colors.green,
        ),
      ]
    );
  }
}

// Stack+Positioned定位
class SP extends StatelessWidget {
  const SP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 300,
      color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            )
          ),
          Text('Hello, world!')
        ],
      )
    );
  }
}

// 浮动导航demo
class FN extends StatelessWidget {
  const FN({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取设备宽高
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.only(top: 50),
          children: [
            ListTile(
              title: Text('商品列表'),
              onTap: () {
                print('商品列表');
              },
            ),
            ListTile(
              title: Text('商品详情'),
              onTap: () {
                print('商品详情');
              },
            ),
            ListTile(
              title: Text('购物车'),
              onTap: () {
                print('购物车');
              },
            ),
            ListTile(
              title: Text('个人中心'),
              onTap: () {
                print('个人中心');
              },
            ),
          ],
        ),
        Positioned(
          left: 0,
          top: 0,
          width: size.width, // 子组件宽度
          height: 44,
          child:Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  color: Colors.red,
                  child: Center(
                    child: Text('导航'),
                  ),
                )
              )
            ],
          )
        )
      ],
    );
  }
}

// Align初识
class AlignD extends StatelessWidget {
  const AlignD({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      color: Colors.red,
      child: Align(
        // alignment: Alignment.bottomLeft,
        alignment: Alignment(1, 1),
        child: Text('Hello, world!'),
      )
    );
  }
}

// Align+Stack
class AS extends StatelessWidget {
  const AS({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('收藏'),
        Text('购买')
      ]
    );
  }
}
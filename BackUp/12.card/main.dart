import 'package:flutter/material.dart';

// aspectratio 或 AspectRatio 调整子组件的宽高比 
// Card 实现卡片效果

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
      body: const CardDemo(),
    ),
  ));
}

// aspectratio
class AR extends StatelessWidget {
  const AR({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2/1, // 宽高比 相对于父组件
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}

// card
class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          elevation: 10, // 阴影
          color: Colors.blue, // 背景色
          margin: EdgeInsets.all(10), // 外边距
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ), // 圆角
          child: Column(
            children: [
              ListTile(
                title: Text('Kuonji Alice'),
                subtitle: Text(
                  'Witch from British',
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                )
              ),
              Divider(),
              ListTile(
                title: Text('Tel: 1234567890'),
              ),
              ListTile(
                title: Text('Email: ChadwickCheng@outlook.com')
              )
            ]
          )
        )
      ]
    );
  }
}

// 图文列表
class CardDemo extends StatelessWidget {
  const CardDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.asset(
                  'images/nero.png',
                  fit: BoxFit.cover,
                )
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/nero.png'),
                ),
                title: Text('Nero Desuyo'),
                subtitle: Text('童女讴歌繁华帝政'),
              )
            ]
          )
        )
      ]
    );
  }
}


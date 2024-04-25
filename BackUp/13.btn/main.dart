import 'package:flutter/material.dart';

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
      body: BD(),
    ),
  ));
}

class BD extends StatelessWidget {
  const BD({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: ()=> print('Elevated Button Pressed'), 
              child: Text('Elevated Button'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), // 圆角
                shape: MaterialStateProperty.all(CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2)
                )), // 圆形 外面建议包一层container设定宽高
              ),
            ),
            TextButton(
              onPressed: ()=> print('Text Button Pressed'), 
              child: Text('Text Button')
            ),
            OutlinedButton(
              onPressed: ()=> print('Outlined Button Pressed'), 
              child: Text('Outlined Button'),
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(color: Colors.green, width: 2)),
              )
            ),
            IconButton(
              onPressed: ()=> print('Icon Button Pressed'), 
              icon: Icon(Icons.add)
            ),
          ]
        ),
        Divider(),
        // 命名构造函数形式创建iconButton
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: ()=> print('Elevated Button Pressed'), 
              icon: Icon(Icons.add),
              label: Text('Elevated Button')
            ),
            TextButton.icon(
              onPressed: ()=> print('Text Button Pressed'), 
              icon: Icon(Icons.add),
              label: Text('Text Button')
            ),
            OutlinedButton.icon(
              onPressed: ()=> print('Outlined Button Pressed'), 
              icon: Icon(Icons.add),
              label: Text('Outlined Button')
            ),
          ],
        ),
        Divider(),
        // 按钮大小通过设定外部容器，按钮会充满. 前提是有在row之类的组件内
        Row(
          children: [
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: ()=> print('Elevated Button Pressed'), 
                child: Text('Elevated Button'),
              ),
            )
          ],
        )
      ],
    );
  }
}
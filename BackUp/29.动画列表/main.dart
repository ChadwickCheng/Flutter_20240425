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
      home: AniListDemo(),
    );
  }
}

class AniListDemo extends StatefulWidget {
  const AniListDemo({super.key});

  @override
  State<AniListDemo> createState() => _AniListDemoState();
}

class _AniListDemoState extends State<AniListDemo> {
  // 通过这个key来控制列表的动画效果
  final _globalKey = GlobalKey<AnimatedListState>();
  List<String> list = ['第一个', '第二个'];
  bool flag = true;
  Widget _buildItem(idx){
    return ListTile(
      title: Text(list[idx]),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (){
          _deleteItem(idx);
        },
      )
    );
  }

  // 缺点 点击过快会报错 使用节流阀 也都就是一个bool值来控制
  _deleteItem(idx){
    // print(idx);
    if(flag ){
      flag = false;
      _globalKey.currentState!.removeItem(idx, (context, animation){
        var removedItem = _buildItem(idx);
        list.removeAt(idx);
        return FadeTransition(
          opacity: animation,
          child: removedItem,
        );
      });
      Timer.periodic(Duration(milliseconds: 500), (timer){
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画列表'),
      ),
      body: AnimatedList(
        key: _globalKey,
        initialItemCount: list.length,
        itemBuilder: ((context, idx, animation){
          return FadeTransition(
            opacity: animation,
            child: _buildItem(idx)
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // 可以不用setState，直接调用insertItem方法
          // setState(() {
            list.add('第${list.length + 1}个');
            _globalKey.currentState!.insertItem(list.length - 1);
          // });
        },
        child: Icon(Icons.add),
      )
    );
  }
}
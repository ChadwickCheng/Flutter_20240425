import 'package:flutter/material.dart';

class KeepAlivePage extends StatefulWidget {
  const KeepAlivePage({super.key});

  @override
  State<KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<KeepAlivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KeepAlive演示'),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return MyContainer(num: index);
        }
      )
    );
  }
}

class MyContainer extends StatefulWidget {

  final int num;

  const MyContainer({super.key, required this.num});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print('第${widget.num}个页面被创建'); // 没缓存，每次滑动都会被创建,即重新build
    return Center(
      child: Text(
        '第${widget.num}个页面',
        style: TextStyle(fontSize: 20),
      )
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true; // 返回true，表示缓存，不会被销毁
  // 或者使用之前定义的工具函数包裹
  // 页面过多 缓存会导致内存占用过大，需要手动销毁
}
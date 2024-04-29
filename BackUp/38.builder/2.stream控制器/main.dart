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
      home: StreamDemo(),
    );
  }
}

class StreamDemo extends StatefulWidget {
  const StreamDemo({super.key});

  @override
  State<StreamDemo> createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  // 需要async包
  final _controller  = StreamController<int>();

  // broadcast可以实现多订阅 默认单订阅
  // final _controller  = StreamController<int>.broadcast();

  // controller会缓存数据,broadcast不会缓存数据,也就是说broadcast只能监听到添加监听之后的数据

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 组件中已经监听了,这里如果不使用broadcast,会报错
    // _controller.stream.listen((event) {
    //   print(event);
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close(); // 关闭Stream
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _controller.stream,
              // 过滤 只有大于2的数据才会被监听
              // stream: _controller.stream.where((event) => event > 2),
              // 过滤 并且将大于2的数据乘以2
              // stream: _controller.stream.where((event) => event > 2).map((event) => event * 2),
              // distinct去重
              builder: (context, snapshot){
                if(snapshot.hasError){
                  return Text('Error: ${snapshot.error}');
                }
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                    return Text('没有Stream');
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  case ConnectionState.active:
                    return Text('active: ${snapshot.data}');
                  case ConnectionState.done:
                    return Text('Stream已关闭');
                }
              },
            ),
            ElevatedButton(onPressed: (){
              // addError方法可以添加错误信息
              // close方法可以关闭Stream
              _controller.add(1); // 添加数据
            }, child: Text('event-1')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              _controller.add(2);
            }, child: Text('event-2')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              _controller.add(3);
            }, child: Text('event-3')),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              _controller.add(4);
            }, child: Text('event-4')),
          ],
        ),
      ),
    );
  }
}
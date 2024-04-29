import 'package:flutter/material.dart';

/*
futurebuilder 追踪future状态并在状态改变时重新构建

示例：
模拟请求数据的1异步方法，加载时有一个指示器，加载完毕显示数据

相较于initstate中调用并setstate,futurebuilder可以处理更复杂逻辑
*/

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
      home: FutureDemo(),
    );
  }
}

class FutureDemo extends StatefulWidget {
  const FutureDemo({super.key});

  @override
  State<FutureDemo> createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  // 模拟请求数据的异步方法
  Future<String> loadData() async{
    await Future.delayed(Duration(seconds: 2));
    return '一些数据';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Demo'),
      ),
      body: Center(
        child: FutureBuilder(
          future: loadData(),
          initialData: '本地初始化数据', // 初始数据,有初始数据就无需判断状态
          builder: (context, snapshot){
            // print(snapshot.connectionState);
            // if(snapshot.connectionState ==  ConnectionState.done){
            //   if(snapshot.hasError){
            //     return Text('Error: ${snapshot.error}');
            //   }else{
            //     return Text(snapshot.data!);
            //   }
            // }else {
            //   return CircularProgressIndicator();
            // }
            if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }else{
              return Text(snapshot.data!);
            }
          },
        )
      ),
    );
  }
}
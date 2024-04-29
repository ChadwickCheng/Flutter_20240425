import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
future 类似于 js 中的 promise，是一个异步操作，可以用来处理异步操作

async await使用方式同js，async用来标记异步函数，await用来等待异步操作完成。await理解为then的语法糖，使得代码如同同步操作一样，易于阅读。
asyncawait处理错误同js，可以使用try catch捕获异常。
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
  Future<String> getSteNum(){
    return Future((){
      var num = 0;
      for(var i=0;i<1000;i++){
        num+=i;
      }
      return "result: ${num}";
    });
    // 返回指定值
    // return Future.value('Hello Future');
    // 返回延迟指定时间后的值
    // return Future.delayed(Duration(seconds: 3), () => 'Hello Future');
    // 抛出异常
    // return Future.error(Exception('error'));
  }

  int _count = 0;

  void _incrementCounter(){
    getSteNum().then((value){
      print(value);
    });
    // 监听异常1 尾部链式调用 catchError 也可以.onError
    // getSteNum().catchError((error){
    //   print(error);
    // });
    // 监听异常2 then中使用onError
    // getSteNum().then((value){
    //   print(value);
    // }, onError: (error){
    //   print(error);
    // });
    // 最后whenComplete 无论成功或失败都会执行
    // getSteNum().then((value){
    //   print(value);
    // }).catchError((error){
    //   print(error);
    // }).whenComplete(() => print('whenComplete'));
    // then也可以链式调用
    

    print('执行了');
    setState(() {
      _count++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          // 圆形进度条
          CircularProgressIndicator(),
          SizedBox(height: 20),
          CircularProgressIndicator(
            color: Colors.red, // 设置进度条颜色
            backgroundColor: Colors.green, // 设置进度条背景颜色
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // 设置进度条的动画颜色
          ),
          SizedBox(height: 20),
          // 线性进度条
          LinearProgressIndicator(),
          SizedBox(height: 20),
          LinearProgressIndicator(
            // value: 0.5, // 设置进度条的进度
            backgroundColor: Colors.green, // 设置进度条背景颜色
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // 设置进度条的动画颜色
          ),
          SizedBox(height: 20),
          // CupertinoActivityIndicator 是 iOS 风格的加载指示器
          CupertinoActivityIndicator(),
          SizedBox(height: 20),
          CupertinoActivityIndicator(
            radius: 20, // 设置指示器的大小
          ),
          Divider(),
          Text('$_count'),
        ],
      ),
    );
  }
}
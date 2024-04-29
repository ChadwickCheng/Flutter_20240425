import 'package:flutter/material.dart';

/*
Stream  异步获取多个值. future一次性获取一个值

StreamBuilder 结合Stream与widget,实现组件局部刷新,跟踪Stream的状态,stream变化时重新构建widget,一般被用于读文件,下载,状态管理
虽然不用builder使用setstate也可以重绘组件,但重绘的是整个组件,而StreamBuilder只重绘局部组件

Random().nextBool() 随机生成true或false

StreamController 用于控制Stream,可以添加数据,关闭Stream,监听Stream的状态
看另一个文件
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
  Future<String> loadData() async{
    return '加载成功';
  }

  Stream<int> loadStreamData(){
    // return Stream.periodic(Duration(seconds: 1),(_) {return 42;});
    return Stream.periodic(Duration(seconds: 1),(int i) {return i;}); // 从0开始每隔一秒递增
  }

  int _num = 0;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   loadData().then((value) => print('Future value: $value'));
  //   loadStreamData().listen(
  //     (value){
  //       // print('Stream value: $value');
  //       setState(() {
  //         _num = value;
  //       });
  //     }
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream Demo'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: loadStreamData(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            if(snapshot.hasError){
              return Text('Error: ${snapshot.error}');
            }
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return Text('没有Stream');
              case ConnectionState.waiting:
                return Text('等待数据...');
              case ConnectionState.active:
                return Text('Stream: ${snapshot.data}');
              case ConnectionState.done:
                return Text('Stream关闭');
              default:
                throw 'StreamBuilder error';
            }
          },
        ) 
      ),
    );
  }
}
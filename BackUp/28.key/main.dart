import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey _globalKey4 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: ListView(
          children: [

            // Container(
            //   height: 300,
            //   width: 300,
            //   color: Colors.red,
            //   // child: Text(
            //   //   '我是父组件,获得子的状态: ${_globalKey4.currentContext}'
            //   // ),
            // ),

            // 获取的都是Box的实例
            // InkWell(
            //   onTap: (){
            //     var boxState = _globalKey4.currentState as _BoxState;
            //     print(boxState._count);
            //     setState(() {
            //       boxState._count++;
            //     });
            //     boxState.run();
            //   },
            //   child: Text('点击我获取最后一个子组件的状态'),
            // ),

            // 获取Box
            // Container(
            //   width: 100,
            //   height: 30,
            //   child: InkWell(
            //     onTap: (){
            //       var boxWidget = _globalKey4.currentWidget as Box;
            //       print(boxWidget.color);
            //       setState(() {
            //         boxWidget.color = Colors.purple; // 只读
            //       });
            //     },
            //     child: Text('点击我获取Box'),
            //   )
            // ),

            //获取渲染属性
            // Container(
            //   width: 100,
            //   height: 30,
            //   child: InkWell(
            //     onTap: (){
            //       var renderBox = _globalKey4.currentContext!.findRenderObject() as RenderBox;
            //       print(renderBox.size);
            //     },
            //     child: Text('点击我获取Box渲染属性'),
            //   )
            // ),

            HomePage(),
            Divider(),
            Box(color:Colors.pink, key: _globalKey4)
          ]
        ),
      )
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 组件类型||key
  // List<Widget> list = [
  //   // 分为局部key与全局key
  //   // 也可以valueKey(val) 还有ObjectKey(obj) 这都是局部key
  //   // 使用局部key的问题: 如果旋转屏幕, 会导致key不一致, 会导致重新创建, 会导致数据丢失; 因为组件由column变为row, 会导致key不一致
  //   Box(color: Colors.red, key: UniqueKey()),
  //   Box(color: Colors.green, key: UniqueKey()),
  //   Box(color: Colors.blue, key: UniqueKey()),
  // ];

  // 可以使用全局key获得子组件的状态

  List<Widget> list = [];
  GlobalKey _globalKey1 = GlobalKey();
  GlobalKey _globalKey2 = GlobalKey();
  GlobalKey _globalKey3 = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      Box(color: Colors.red, key: _globalKey1),
      Box(color: Colors.green, key: _globalKey2),
      Box(color: Colors.blue, key: _globalKey3),
    ];
  }
  
  var ori;
  @override
  Widget build(BuildContext context) {
    // 获取屏幕是否旋转
    // print(MediaQuery.of(context).orientation);
    ori = MediaQuery.of(context).orientation;
    return Column(
      children:[
        ori == Orientation.portrait ? Column(children: list)  : Row(children: list),
        ElevatedButton(onPressed: (){
          setState(() {
            list.shuffle();
          });
        }, child: Text('打乱顺序'))
      ]
    );
  }
}

class Box extends StatefulWidget {
  final Color color;
  const Box({Key? key, required this.color}): super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  void run(){
    print('我是子组件,我run了');
  }
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () => {
          setState(() {
            _count++;
          })
        },
        child:Text('$_count', style: Theme.of(context).textTheme.headlineMedium,),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.color),
        ),
      )
    );
  }
}
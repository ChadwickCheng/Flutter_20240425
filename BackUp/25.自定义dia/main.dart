import 'package:flutter/material.dart';
import './Widget/dialog.dart';

void main() {
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
      title: 'Dialog Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dialog Demo'),
        ),
        body: DiaDemo(),
      ),
    );
  }
}

class DiaDemo extends StatefulWidget {
  const DiaDemo({super.key});

  @override
  State<DiaDemo> createState() => _DiaDemoState();
}

class _DiaDemoState extends State<DiaDemo> {

  void _myDia() async{
    var res = await showDialog(
      barrierDismissible: false, // 点击外部不消失
      context: context, 
      builder: (context){
        return MyDia(
          title: '自定义标题',
          content: '自定义内容',
          onTap: (){
            print('点击了确定');
            Navigator.of(context).pop('some value');
          },
        );
      }
    );
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: ()=>_myDia(), 
          child: Text('自定义dia')
        )
      ],
    );
  }
}
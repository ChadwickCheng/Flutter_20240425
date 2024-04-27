import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  void _showAlert() async{
    var res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Text('This is an alert dialog.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('取消'); // 返回值
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop('确定');
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
    print(res);
  }

  void _showSim() async{
    var res = await showDialog(
      // barrierDismissible: false, // 点击外部不消失 默认为true
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('Simple Dialog'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop('Option A');
              },
              child: Text('Option A'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop('Option B');
              },
              child: Text('Option B'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop('Option C');
              },
              child: Text('Option C'),
            ),
          ],
        );
      },
    );
    print(res);
  }

  void _showBot() async{
    var res = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container( // 使用container控制高度
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text('Option A'),
                onTap: () {
                  Navigator.of(context).pop('Option A');
                },
              ),
              ListTile(
                title: Text('Option B'),
                onTap: () {
                  Navigator.of(context).pop('Option B');
                },
              ),
              ListTile(
                title: Text('Option C'),
                onTap: () {
                  Navigator.of(context).pop('Option C');
                },
              ),
            ],
          ),
        );
      },
    );
    print(res);
  }

  // 三方插件实现toast 类似于antd的message
  void _toast(){
    Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT, // 提示时间 安卓
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1, // 提示时间 ios web
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed:  _showAlert,
          child: Text('Show Alert Dialog'),
        ),
        Divider(),
        ElevatedButton(
          onPressed:  _showSim,
          child: Text('Show Simple Dialog'),
        ),
        Divider(),
        ElevatedButton(
          onPressed:  _showBot,
          child: Text('Show Bottom Sheet'),
        ),
        Divider(),
        ElevatedButton(
          onPressed:  _toast,
          child: Text('Show Toast'),
        ),
      ],
    );
  }
}
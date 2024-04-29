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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormDemo(),
    );
  }
}

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  int sex = 1;
  bool flag = true;

  List _hobby = [
    {
      'checked': true,
      'title': '吃饭'
    },
    {
      'checked': false,
      'title': '睡觉'
    },
    {
      'checked': true,
      'title': '打豆豆'
    }
  ];

  bool switchFlag = false;

  _onChanged(value){
    setState((){
      sex = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 单选框
                // 写法一
                // Text('male'),
                // Radio(value:1, groupValue: sex, onChanged: _onChanged),
                // SizedBox(width: 20,),
                // Text('female'),
                // Radio(value:2, groupValue: sex, onChanged: _onChanged),
              ],
            ),
            // 单选框写法二 这样写默认占据一行
            RadioListTile(value: 1, groupValue: sex, onChanged: _onChanged, title: Text('female')),
            RadioListTile(value: 2, groupValue: sex, onChanged: _onChanged, title: Text('male')),
            Column(
              children: [
                // 多选按钮
                Checkbox(value: flag, onChanged:(value){
                  setState(() {
                    flag = value!;
                  });
                }),
                Divider(),
                // 吃饭睡觉打豆豆
                Column(
                  children: _hobby.map((value){
                    return CheckboxListTile(
                      value: value['checked'],
                      onChanged: (v){
                        setState(() {
                          value['checked'] = v!;
                        });
                      },
                      title: Text(value['title']),
                    );
                  }).toList(),
                )
              ],
            ),
            Divider(),
            // switch
            Switch(value: switchFlag, onChanged: (value){
              setState(() {
                switchFlag = value;
              });
            }),
          ]
        ),
      ),
    );
  }
}
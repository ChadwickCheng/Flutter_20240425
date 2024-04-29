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
  String username = '';

  late TextEditingController _usernameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController.fromValue(
      TextEditingValue(
        text: '初始值', // 初始值
        // selection: TextSelection(
        //   baseOffset: 2, // 选中起始位置
        //   extentOffset: 5, // 选中结束位置
        // ),
        selection: TextSelection.fromPosition(
          TextPosition(
            offset: username.length, // 选中起始位置
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
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
            // 单行输入框
            TextField(
              controller: _usernameController, // 控制器来赋值初始值
              // obscureText: true, // 隐藏输入内容 默认使用安全键盘
              decoration: InputDecoration(
                // icon: Icon(Icons.people), // 框外图标
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: const Color.fromARGB(255, 16, 6, 5)),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: '用户名',
                hintText: '请输入用户名',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.close),
                // prefixText: '用户名：', // 前缀文本
              ),
              onChanged: (value) => {
                setState(() {
                  username = value;
                })
              },
            ),
            // 多行
            SizedBox(height: 20),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: '多行输入框',
                hintText: '请输入多行内容',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('输入的内容是：$username')
          ],
        ),
      ),
    );
  }
}
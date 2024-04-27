import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Home Page 命名路由实例 不需要引入'),
        ElevatedButton(
          onPressed: ()=> Navigator.pushNamed(context, '/form'),
          child: Text('Form Page'),
        ),
        Divider(),
        ElevatedButton(
          // onPressed: ()=> Navigator.pushNamed(context, '/homeSearch', arguments: {'searchWord': 'Hello World!'}), // 普通跳转 路由栈会新增一个页面
          onPressed: ()=> Navigator.pushReplacementNamed(context, '/homeSearch', arguments: {'searchWord': 'Hello World!'}), // 替换跳转 路由栈不会新增页面
          // onPressed: ()=> Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context){
          //       return Page();
          //     }
          //   )
          // ), // 替换跳转 路由栈不会新增页面 可以传递一个index给首页来切换tab
          child: Text('命名路由传值 Home Search Page'),
        ),
      ],
    );
  }
}
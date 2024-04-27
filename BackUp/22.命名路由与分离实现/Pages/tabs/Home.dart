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
          onPressed: ()=> Navigator.pushNamed(context, '/homeSearch', arguments: {'searchWord': 'Hello World!'}),
          child: Text('命名路由传值 Home Search Page'),
        ),
      ],
    );
  }
}
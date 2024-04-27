import 'package:flutter/material.dart';

// 命名路由跳转传值

class HomeSearchPage extends StatefulWidget {
  final Map arguments;
  // final String searchWord;
  const HomeSearchPage({super.key, required this.arguments});

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Search Page'),
      ),
      body: Column(
        children: [
          Text('Home Search Page'),
          Text('Search Word: ${widget.arguments['searchWord']}'),
        ],
      ),
    );
  }
}
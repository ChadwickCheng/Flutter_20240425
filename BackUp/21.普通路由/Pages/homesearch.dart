import 'package:flutter/material.dart';

class HomeSearchPage extends StatefulWidget {
  final String searchWord;
  const HomeSearchPage({super.key, required this.searchWord});

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
          Text('Search Word: ${widget.searchWord}'),
        ],
      ),
    );
  }
}
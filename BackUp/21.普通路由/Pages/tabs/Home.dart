import 'package:flutter/material.dart';
import '../homesearch.dart';
import '../form.dart';

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
        Text('Home Page'),
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => HomeSearchPage(searchWord: '摩根',))
            );
          }, 
          child: Text('Go to Home Search Page')
        ),
        Divider(),
        ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => FormPage())
            );
          }, 
          child: Text('Go to Form Page')
        ),
      ],
    );
  }
}
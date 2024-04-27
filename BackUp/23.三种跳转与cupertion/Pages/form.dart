import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: Column(
        children: [
          Text('Form Page'),
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text('Go Back')
          ),
        ],
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';

class KeyBoard extends StatefulWidget {
  final StreamController<int> inputController;

  const KeyBoard({super.key, required this.inputController});

  @override
  State<KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<KeyBoard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, // 适应子组件的大小
      crossAxisCount: 3,
      childAspectRatio: 5/3,
      children: List.generate(9,(idx){
          return TextButton(onPressed: (){
            widget.inputController.add(idx+1);
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder()),
            backgroundColor: MaterialStateProperty.all(Colors.primaries[idx][300]),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          child: Text('${idx+1}', style: Theme.of(context).textTheme.headlineMedium,));
        }
      )
    );
  }
}
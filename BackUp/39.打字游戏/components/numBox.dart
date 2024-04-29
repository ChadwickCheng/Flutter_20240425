import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';

class NumBox extends StatefulWidget {
  final StreamController<int> inputController;
  final StreamController<int> scoreController;
  const NumBox({super.key, required this.inputController, required this.scoreController});

  @override
  State<NumBox> createState() => _NumBoxState();
}

class _NumBoxState extends State<NumBox> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late int a, b;
  late double x;
  late Color color;
  void reset(){
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 250;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.inputController.stream.listen((e){
      if(e == a + b){
        reset();
        widget.scoreController.add(3); // 答对加3分
        _animationController.forward(from: 0.0);
      }
    });

    reset();

    _animationController = AnimationController(
      duration: Duration(milliseconds: Random().nextInt(5000)+5000),
      vsync: this
    )
    ..forward();
    // _animationController.forward();
    // 动画执行完毕后重新开始
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        widget.scoreController.add(-1); // 没来得及答题扣1分
        reset();
        _animationController.forward(from: 0.0);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child){
        return Positioned(
          top: Tween(begin: -50.0, end: 500.0).animate(_animationController).value,
          left: x,
          child: Container(
            padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(18)
            ),
            child: Text(
              '$a+$b=?',
              style: TextStyle(
                fontSize: 24,
              ),
            )
          ),
        );
      },
    );
  }
}
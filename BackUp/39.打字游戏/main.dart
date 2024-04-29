import 'dart:async';
import 'package:flutter/material.dart';
import './components/keyboard.dart';
import './components/numBox.dart';

/*
打字游戏最主要的是利用StreamController来实现状态共享，这样就可以在多个组件之间共享状态。
其次就是基础的样式与动画的使用，这里使用了Stack来实现多个组件的叠加，使用了Align来实现组件的对齐。
*/

void main(){
  runApp(MaterialApp(
    title: '打字游戏',
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home:Game(),
  ));
}

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  // 使用broadcast并传递控制器实现状态共享
  StreamController<int> _inputController = StreamController.broadcast();
  StreamController<int> _scoreController = StreamController.broadcast();
  int score = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _inputController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: _scoreController.stream,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot){
            if(snapshot.hasData){
              score += snapshot.data as int;
              return Text('分数: ${score}');
            }
            if(snapshot.hasError){
              return Text('输入错误');
            }
            return Text('等待输入');
          },
        ),
      ),
      body: Stack(
        children: [
          ...List.generate(3, (idx){
            return NumBox(inputController: _inputController, scoreController: _scoreController,);
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: KeyBoard(inputController: _inputController,),
          )
        ],
      ),
    );
  }
}
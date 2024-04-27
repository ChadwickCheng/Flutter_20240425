import 'package:flutter/material.dart';
import './Pages/tabs.dart';

/*
仿咸鱼button
*/

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.yellow,
    ),
    title: 'Tutti.fan!',
    home: BaseComponent(),
  ));
}
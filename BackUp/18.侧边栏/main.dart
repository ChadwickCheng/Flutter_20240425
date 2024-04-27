import 'package:flutter/material.dart';
import './Pages/tabs.dart';

/*
侧边栏
*/

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.yellow,
    ),
    title: 'Tutti.fan!',
    home: BaseComponent(),
    debugShowCheckedModeBanner: false,
  ));
}
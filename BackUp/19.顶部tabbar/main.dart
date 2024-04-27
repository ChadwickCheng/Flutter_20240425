import 'package:flutter/material.dart';
import './Pages/tabs.dart';

/*
顶部导航
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
import 'package:flutter/material.dart';
import './Pages/tabs.dart';

/*
顶部导航+底部导航

/*
之前的痛点 有了tabbar没法使用bottomNavigationBar，因为共占一个body

解决：对应的组件再设置sca和tabbar 以home为例

*/
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
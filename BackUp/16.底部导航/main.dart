import 'package:flutter/material.dart';
import './Pages/tabs.dart';

/*
底部导航类似于微信小程序的底部导航，可以在不同的页面之间切换
currentIndex: 当前选中的导航项的索引
最佳实践是抽离sca作为一个有状态组件
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
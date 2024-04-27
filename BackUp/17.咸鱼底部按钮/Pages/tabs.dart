import 'package:flutter/material.dart';
import './tabs/Home.dart';
import './tabs//Profile.dart';
import './tabs/Search.dart';
import './tabs/Settings.dart';
import './tabs//Message.dart';

class BaseComponent extends StatefulWidget {
  const BaseComponent({super.key});

  @override
  State<BaseComponent> createState() => _BaseComponentState();
}

class _BaseComponentState extends State<BaseComponent> {

  int _currentIndex = 0;

  List<Widget> _widgetList = [
    HomePage(),
    SearchPage(),
    MessagePage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Tutti.fan!'),
      ),
      body: _widgetList[_currentIndex],
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
        ),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2 ? Color.fromARGB(255, 54, 127, 244):Colors.yellow,
          child: Icon(
            Icons.add,
            color: _currentIndex == 2 ? Colors.red : Colors.black
          ),
          onPressed: (){
            setState(() {
              _currentIndex = 2;
            });
          },
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (v){ // 点击导航项时触发 自动传入一个索引值
          // print(v);
          setState(() {
            _currentIndex = v;
          });
        },
        iconSize: 20, // 底部图标大小
        fixedColor: Colors.pink, // 选中颜色
        type: BottomNavigationBarType.fixed, //四个及以上需要配置
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
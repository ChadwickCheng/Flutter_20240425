import 'package:flutter/material.dart';
import './tabs/Home.dart';
import './tabs//Profile.dart';
import './tabs/Search.dart';
import './tabs/Settings.dart';
import './tabs//Message.dart';

/*
drawheader默认由内容撑开
可以row+expanded撑开全部
*/

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
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 1,
                  // child: DrawerHeader(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('images/nero.png'),
                  //       fit: BoxFit.cover,
                  //       opacity: 0.5
                  //     )
                  //   ),
                  //   // 个人信息渲染，drawer有专门的组件，不需要自己写
                  //   child: Column(
                  //     children: [
                  //       ListTile(
                  //         leading: CircleAvatar(
                  //           backgroundImage: AssetImage('images/nero.png'),
                  //           radius: 30,
                  //         ),
                  //         title: Text('Tutti.fan'),
                  //         subtitle: Text('Tutti.fan.com')
                  //       )
                  //     ]
                  //   ),
                  // ),
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                      'Tutti.fan',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      )
                    ),
                    accountEmail: Text(
                      'Tutti.fan.com',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                      )
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage('images/nero.png'),
                    ),
                    otherAccountsPictures: [
                      CircleAvatar(
                        backgroundImage: AssetImage('images/nero.png'),
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('images/nero.png'),
                      )
                    ],
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/nero.png'),
                        fit: BoxFit.cover,
                        // colorFilter: ColorFilter.mode(Colors.yellow.withOpacity(0.5), BlendMode.hardLight)
                        opacity: 0.5
                      )
                    ),
                  )
                )
              ]
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text('个人中心'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text('设置中心'),
            ),
          ]
        ),
      ),
      endDrawer: Drawer(
        child: Text('右侧侧边栏'),
      ),
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
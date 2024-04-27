import 'package:flutter/material.dart';

/*
1. with SingleTickerProviderStateMixin
2. 声明一个TabController
3. appbar的bottom
4. 配合body的Tabbarview
5. 两个地方配置controller
*/

class BaseComponent extends StatefulWidget {
  const BaseComponent({super.key});

  @override
  State<BaseComponent> createState() => _BaseComponentState();
}

class _BaseComponentState extends State<BaseComponent> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Tutti.fan!'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            print('menu clicked');
          },
        ),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              print('search clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              print('settings clicked');
            },
          ),
        ],
        bottom: TabBar(
          // isScrollable: true, // 是否可以滚动
          indicatorColor: Colors.white, // 指示器颜色
          indicatorWeight: 2, // 指示器高度
          indicatorPadding: EdgeInsets.all(5), // 指示器内边距
          // indicatorSize: TabBarIndicatorSize.label, // 指示器大小
          labelColor: Colors.white, // 选中文字颜色
          unselectedLabelColor: Colors.black, // 未选中文字颜色
          labelStyle: TextStyle(fontSize: 20), // 选中文字样式
          unselectedLabelStyle: TextStyle(fontSize: 14), // 未选中文字样式
          indicator: BoxDecoration(
            color: Colors.red, // 选中效果
            borderRadius: BorderRadius.circular(10), // 圆角效果
          ),
          controller: _tabController,
          tabs:[
            Tab(
              child: Text('Home'),
            ),
            Tab(
              child: Text('Search'),
            ),
            Tab(
              child: Text('Message'),
            ),
          ],
        )
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: [
              ListTile(
                title: Text('This is Home Page'),
              ),
            ],
          ),
          ListView(
            children: [
              ListTile(
                title: Text('This is Search Page'),
              ),
            ],
          ),
          ListView(
            children: [
              ListTile(
                title: Text('This is Message Page'),
              ),
            ],
          ), 
        ],
      ),
    );
  }
}
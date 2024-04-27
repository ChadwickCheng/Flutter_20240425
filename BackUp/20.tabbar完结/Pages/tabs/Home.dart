import 'package:flutter/material.dart';
import '../../utils/keepAliveWrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // 监听control 改变两次 离开与进入
    _tabController.addListener(() {
      // if (_tabController.indexIsChanging) {
      //   print('indexIsChanging');
      // } else {
      //   print('indexIsNotChanging');
      // }

      // print(_tabController.index);
      // 只获取一次 
      // if(_tabController.animation!.value == _tabController.index) {
      //   print(_tabController.index);
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30), // appbar height
        child: AppBar(
          elevation: 10, // Shadow
          title: Container(
            height: 30, // TabBar height
            child: TabBar(
              onTap:(idx){// 只监听点击 无法监听滑动
                print(idx);
              },
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text('Home home'),
                ),
                Tab(
                  child: Text('Home setting')
                ),
              ],
            )
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          KeepAliveWrapper(child: Center(
            child: Text('Home home'),
          )),
          Center(
            child: Text('Home setting'),
          ),
        ],
      ),
    );
  }
}
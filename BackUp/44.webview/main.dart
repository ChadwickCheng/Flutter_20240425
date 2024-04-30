import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import './pages/newsContent.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:DioDemo(),
    );
  }
}

class DioDemo extends StatefulWidget {
  const DioDemo({super.key});
  @override
  State<DioDemo> createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {

  /*
  下拉刷新 上拉加载更多
  官方提供下拉刷新的组件RefreshIndicator 

  上拉加载需要自己实现 listview的ScrollController
  滚动条滚动到底部时触发加载更多
  */

  Dio dio = Dio();

  List _list = [];
  int _page = 1;
  bool _flag = true; // 节流阀 用户会不停的上拉加载
  bool _hasMore = true;

  _getData() async{
    if(_flag && _hasMore){
      _flag = false;
      String url = 'https://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}';
      var res = await dio.get(
        url
      ); // php后端返回的数据 相较于node有些不同
      var newData = json.decode(res.data);
      setState(() {
        _list = _list..addAll(newData['result']);
        _page++;
        _flag = true;
        if(newData['result'].length == 0){
          _hasMore = false;
        }
      });
    }
  }

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getData();

    // 监听滚动条事件
    _scrollController.addListener(() {
      // _scrollController.position.pixels; // 获取滚动条滚动的高度
      // _scrollController.position.maxScrollExtent; // 获取整个页面的高度
      // 二者相等时说明滚动条滚动到了底部
      // -30 提前30像素加载更多 用户体验更好
      if(_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 30){
        print('滚动到了底部');
        _getData();
      };
    });
  }

  Widget _processInd(){
    if(_hasMore){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else{
      return Center(
        child: Text('我是有底线的'),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Demo'),
      ),
      body: Center(
        child: _list.isNotEmpty?
        RefreshIndicator(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _list.length,
            itemBuilder: (context,index){
              if(index == _list.length-1){
                return Column(
                  children: [
                    ListTile(
                      title: Text('${_list[index]['title']} 最后一页'),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsContentPage(arguments: {'id':_list[index]['aid']})));
                      },
                    ),
                    _processInd()
                  ],
                );
              }else{
                return ListTile(
                  title: Text(_list[index]['title']),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NewsContentPage(arguments: {'aid':_list[index]['aid']})));
                  },
                );
              }
            },
          ), 
          onRefresh: () async{
            // print('下拉刷新');
            _getData();
          })
        :_processInd(),
      ),
    );
  }
}
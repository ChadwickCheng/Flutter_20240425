import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

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
  // 1. json与map互转
  void jsonMap() {
    // json转map
    String jsonStr = '{"name":"张三","age":20}';
    Map<String, dynamic> jsonMap = json.decode(jsonStr);
    print(jsonMap['name']);
    print(jsonMap['age']);

    // map转json
    Map<String, dynamic> map = {'name': '李四', 'age': 30};
    String jsonStr2 = json.encode(map);
    print(jsonStr2);
  }

  Dio dio = Dio();

  _getData() async{
    var res = await dio.get(
      'https://jdmall.itying.com/api/httpGet',
      queryParameters: {'username':'张三', 'age':20},
    );
    // 默认返回的是Map,这是dio自动转换的
    print(res.data);
  }

  _postData() async{
    var res = await dio.post(
      'https://jdmall.itying.com/api/httpPost',
      data: {'username':'张三', 'address':'北京'},
    );
    print(res);
  }

  _putData() async{
    var res = await dio.put(
      'https://jdmall.itying.com/api/httpPut',
      data: {'id':'123','username':'张三', 'address':'北京'},
    );
    print(res);
  }

  _deleteData() async{
    var res = await dio.delete(
      'https://jdmall.itying.com/api/httpDelete',
      queryParameters: {'id':'123'},
    );
    print(res);
  }

  // 获得jd分类数据
  /*
  两种渲染方式
  1. 经典的web方式 声明函数 生命周期函数内调用
  2. flutter独占 futureBuilder
  */
  // List _list = [];
  _getCat() async{
    var res = await dio.get(
      'https://jdmall.itying.com/api/pcate'
    );
    // setState(() {
    //   _list = res.data['result'];
    // });
    return res.data['result'];
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _getCat();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Demo'),
      ),
      body: Center(
        child: Center(
          child: ListView(
            children: [
              ElevatedButton(
                onPressed: _getData,
                child: Text('get请求数据'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: _postData,
                child: Text('post请求数据'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: _putData,
                child: Text('put修改数据'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: _deleteData,
                child: Text('delete删除数据'),
              ),
              Divider(),
              // Column(
              //   children: _list.isNotEmpty?
              //   _list.map((value){
              //     return ListTile(
              //       title: Text(value['title']),
              //     );
              //   }).toList():
              //   [Text('加载中...')],
              // )

              FutureBuilder(
                future: _getCat(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasError){
                      return Center(child:Text('Error: ${snapshot.error}'));
                    }else{
                      return Column(
                        children: (snapshot.data as List).map<Widget>((value){
                          return ListTile(
                            title: Text('${value['title']} by futureBuilder'),
                          );
                        }).toList(),
                      );
                    }
                  }else{
                    return CupertinoActivityIndicator();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
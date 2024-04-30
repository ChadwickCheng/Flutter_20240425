import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: StoragePage(),
      )
    );
  }
}

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {

   final Future<SharedPreferences> _prefs=SharedPreferences.getInstance();

  _saveData() async {
    final prefs = await _prefs;
    prefs.setString("username", "张三");
    prefs.setInt("age", 20);

    List<String> userinfo=["张三","李四","王五"];
    prefs.setStringList("userinfo", userinfo);


    List<Map> newsList=[
      {
        "title":"我是一个标题"
      },{
        "title":"我是二个标题"
      },{
        "title":"我是一个标题"
      },{
        "title":"我是一个标题"
      },{
        "title":"我是一个标题"
      },
    ];

    prefs.setString("newsList", json.encode(newsList));
  }

  _getData() async {
    final prefs = await _prefs;
    String? username = prefs.getString("username");
    print(username);

    int? age = prefs.getInt("age");
    print(age);

    List<String>? list=prefs.getStringList("userinfo");
    print(list);
    print(list![0]);


    //获取List<Map>
      String? newsList=prefs.getString("newsList");
      var tempData=json.decode(newsList!);
      print(tempData[0]);
      print(tempData[0]["title"]);

  }
  _removeData() async {
      final prefs = await _prefs;
      prefs.remove("username");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _saveData,
              child: const Text('保存数据'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _getData,
              child: const Text('获取数据'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _removeData,
              child: const Text('清除数据'),
            )
          ],
        ),
      ),
    );
  }
}

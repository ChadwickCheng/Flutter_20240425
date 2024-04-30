import 'dart:convert';
import '../../tools/storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ffi';

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
        body: CategoryPage(),
      )
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () async {
                Storage.setData("username", "李四");
              },
              child: const Text("设置数据")),
          ElevatedButton(
              onPressed: () async {
                var username = await Storage.getData("username");
                // print(username as String);
                print(username is String);
                print(username);
              },
              child: const Text("获取数据")),
          ElevatedButton(
              onPressed: () {
                List<Map> list = [
                  {"title": "一个新闻111", "author": "itying"},
                  {"title": "一个新闻", "author": "itying"},
                  {"title": "一个新闻", "author": "itying"},
                ];
                Storage.setData("newslist", list);
              },
              child: const Text("设置List")),
          ElevatedButton(
              onPressed: () async {
                var list = await Storage.getData("newslist");
                print(list is List);
                print(list[0]);
              },
              child: const Text("获取List数据")),
          ElevatedButton(
              onPressed: () async {
                Storage.setData("num", 123.4);
              },
              child: const Text("设置num数据")),
          ElevatedButton(
              onPressed: () async {
                var num = await Storage.getData("num");                           
                print(num is double);
                print(num);
              },
              child: const Text("获取num数据")),
            ElevatedButton(
              onPressed: () async {
                Storage.setData("flag", false);
              },
              child: const Text("设置bool数据")),
          ElevatedButton(
              onPressed: () async {
                var flag = await Storage.getData("flag");                           
                print(flag is bool);
                print(flag);
              },
              child: const Text("获取bool数据")),
        ],
      ),
    );
  }
}


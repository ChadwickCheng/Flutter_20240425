import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// column超出长度会报错
// 垂直列表，container设置宽度无效
// 水平列表，container设置高度无效
// 最佳实践是外部包一个container，设置宽高

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.yellow,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Tutti.fan'),
      ),
      body: const MyListViewByBuild(),
    ),
  ));
}

// 初识垂直列表
class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.map), // 图标
          title: const Text('Map'),
          subtitle: const Text('Map Subtitle'),
          trailing: const Icon(Icons.arrow_forward),
          onTap: ()=>print('Map'),
          onLongPress: ()=>print('Map LongPress'),
        ),
        const Divider(),
        ListTile(
          leading: Image.asset('images/nero.png'),
          title: const Text('Album'),
          subtitle: const Text('Album Subtitle'),
        ),
        const Divider(),
        Image.asset(
          'images/nero.png',
          width: 200,
          height: 200,
          ),
        Container(
          alignment: Alignment.center,
          child: const Text('Hello World'),
        )
      ],
    );
  }
}

// 初识水平列表
class MyListViewHori extends StatelessWidget {
  const MyListViewHori({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160,
            color: Colors.red,
            margin: const EdgeInsets.only(right: 10),
            child: const Text('Hello World'),
          ),
          Container(
            width: 160,
            color: Colors.blue,
            margin: const EdgeInsets.only(right: 10),
            child: const Text('Hello World'),
          ),
          Container(
            width: 160,
            color: Colors.green,
            margin: const EdgeInsets.only(right: 10),
            child: const Text('Hello World'),
          ),
          Container(
            width: 160,
            color: Colors.yellow,
            margin: const EdgeInsets.only(right: 10),
            child: const Text('Hello World'),
          ),
        ],
      )
    );
  }
}

// 这个数据最终是从服务器获取的
final articleDetail = [
  {
    'title': 'Article 1',
    'author': 'Author 1',
  },
  {
    'title': 'Article 2',
    'author': 'Author 2',
  },
];

// 动态渲染 通过自己写方法
class MyListViewByFunc extends StatelessWidget {
  const MyListViewByFunc({super.key});

  // for in
  // List<Widget> _initListData(){
  //   List<Widget> list = [];
  //   for (var item in articleDetail) {
  //     list.add(ListTile(
  //       title: Text(item['title']!),
  //       subtitle: Text(item['author']!),
  //     ));
  //     list.add(const Divider());
  //   }
  //   return list;
  // }

  // map
  // 使用toList因为map返回的是Iterable
  List<Widget> _initListData(){
    return articleDetail.map((item) {
      return ListTile(
        title: Text(item['title']!),
        subtitle: Text(item['author']!),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: _initListData(),
    );
  }
}

// 动态渲染 使用ListView.builder 推荐，因为简单有效
class MyListViewByBuild extends StatelessWidget {
  const MyListViewByBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articleDetail.length,
      itemBuilder: (context, index){ // context是上下文，index是索引
        return ListTile(
          title: Text(articleDetail[index]['title']!),
          subtitle: Text(articleDetail[index]['author']!),
        );
      },
    );
  }
}
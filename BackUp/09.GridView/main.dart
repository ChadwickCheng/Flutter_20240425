import 'package:flutter/material.dart';

// gridview count extent builder

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

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.yellow,
    ),
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Tutti.fan'),
      ),
      body: const GridByBuild(),
    ),
  ));
}

// count
class GridByCount extends StatelessWidget {
  const GridByCount({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // 一行几个
      crossAxisSpacing: 10, // 水平间距
      mainAxisSpacing: 10, //垂直间距
      childAspectRatio: 0.7, // 宽高比
      padding: const EdgeInsets.all(10),
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'first',
            style: TextStyle(
              fontSize: 20
            )
            ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'first',
            style: TextStyle(
              fontSize: 20
            )
            ),
        )
      ]
    );
  }
}

// extent
class GridByExtent extends StatelessWidget {
  const GridByExtent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 40, // 一行最大宽度
      children: <Widget>[
        const Icon(Icons.map),
        Image.asset('images/nero.png'),
        Container(
          alignment: Alignment.center,
          child: const Text('Hello World'),
        ),
      ]
    );
  }
}

// builder
class GridByBuild extends StatelessWidget {
  const GridByBuild({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: articleDetail.length, // 不指定则无限
      // SliverGridDelegateWithFixedCrossAxisCount 实现count
      // SliverGridDelegateWithMaxCrossAxisExtent 实现extent
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            articleDetail[index]['title']!,
            style: TextStyle(
              fontSize: 20
            )
            ),
        );
      }
    );
  }
}
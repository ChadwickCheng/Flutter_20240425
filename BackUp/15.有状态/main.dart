import 'package:flutter/material.dart';

/*
无状态组件；变量会改变，但是不会触发页面刷新
 
*/ 

void main(){
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.yellow,
    ),
    title: 'Tutti.fan!',
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Tutti.fan!'),
      ),
      body: ListPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('FloatingActionButton click');
        },
        child: const Icon(Icons.add),
      )
    ),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _numCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('build $_numCount');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${_numCount}', style: Theme.of(context).textTheme.displayMedium),
          SizedBox(height: 60,),
          ElevatedButton(
            onPressed: (){
              // setState类似于react类组件的this.setState，会触发页面刷新,重新build
              // 注意加const 可以在build时避免重复创建
              setState(() {
                _numCount++;
              });
            }, 
            child: Text('+1')
          )
        ]
      )
    );
  }
}

// 动态生成列表
class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final List<Widget> _list = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column( // Listview不能放在Column中，会报错
          children: _list,
        ),
        ElevatedButton(
          onPressed: (){
            setState(() {
              _list.add(Text('item ${_list.length}'));
            });
          }, 
          child: Text('Add Item')
        )
      ]);
  }
}
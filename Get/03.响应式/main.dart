import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './person.dart';
import './animal.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

/*
使用setstate的缺点，每次更新会重新渲染整个页面，而使用getx的obx只会更新需要更新的部分 并且只需要使用无状态组件

RxType定义，或者.obs 推荐使用.obs
使用时类似于vue3的ref，需要.value
动态渲染组件需要使用Obx并在其中定义一个匿名函数，返回需要渲染的组件

响应式数组需要尾插，可以直接add，不需要.value

响应式对象 就是把对象的属性变成响应式；
也可以使用.obs。但需要注意 a.value.prop = '1' a.value = a.value; 重新赋值才能触发更新; 或者如同下面实例直接重新构造函数赋值
*/

class MyHomePage extends StatelessWidget {
  final RxInt _counter = RxInt(0);
  final RxString _username = "zhangsan".obs;
  final RxList _list = ["张三", "李四"].obs;
  final Rx<String> _sex = Rx<String>("男");

  //实例化lei

  var p =  Person();

  var a= Animal("xiao mao", 2).obs;

  MyHomePage({super.key});
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
            Obx(() => Text(
                  "${_counter.value}",
                  style: Theme.of(context).textTheme.headline1,
                )),
            const SizedBox(),
            Obx(() {
              return Text(_username.value,
                  style: Theme.of(context).textTheme.subtitle2);
            }),
            const SizedBox(),
            Obx(() {
              return Column(
                children: _list.map((v) {
                  return ListTile(title: Text(v));
                }).toList(),
              );
            }),
            const SizedBox(),
            Obx(() =>
                Text(_sex.value, style: Theme.of(context).textTheme.headline6)),
            const SizedBox(),
            Obx(() => Text("${p.username}",
                style: Theme.of(context).textTheme.headline4)),

                  const SizedBox(),
            Obx(() => Text(a.value.username,
                style: Theme.of(context).textTheme.headline4))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _counter.value++;

          _username.value = "lisi";

          _list.add("王五"); //注意

          p.username.value=p.username.value.toUpperCase();

        
          a.value=Animal("小狗", 3);
        },
      ),
    );
  }
}

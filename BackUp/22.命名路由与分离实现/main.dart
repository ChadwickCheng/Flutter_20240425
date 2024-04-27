import 'package:flutter/material.dart';
// import './Pages/tabs.dart';

// import './Pages//homesearch.dart';
// import './Pages//form.dart';

import './router/index.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // 1. 命名路由实例
  // Map routes = {
  //   '/': (context) => BaseComponent(),
  //   '/form': (context) => FormPage(),
  //   '/homeSearch': (context, {arguments}) => HomeSearchPage(arguments: arguments),
  // };

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      title: 'Tutti.fan!',
      // home: BaseComponent(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {
      //   '/': (context) => BaseComponent(),
      //   '/form': (context) => FormPage(),
      // }

      // // 2. 固定写法
      // onGenerateRoute: (RouteSettings settings) {
      //   // 统一处理
      //   final String? name = settings.name;
      //   final Function? pageContentBuilder = widget.routes[name];
      //   if (pageContentBuilder != null) {
      //     if (settings.arguments != null) {
      //       final Route route = MaterialPageRoute(
      //       builder: (context) =>
      //       pageContentBuilder(context, arguments: settings.arguments));
      //       return route;
      //     } else {
      //       final Route route =
      //       MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      //       return route;
      //     }
      //   }
      //   return null;
      // },
      onGenerateRoute: onGenerateRoute,
    );
  }
}
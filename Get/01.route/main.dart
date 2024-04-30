import 'package:flutter/material.dart';
import './routers/routers.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      initialRoute: "/",
      // onGenerateRoute: onGenerateRoute,
      defaultTransition: Transition.rightToLeft, // 默认跳转动画 也可以单独为某个页面设置
      getPages:AppPage.routes, // get路由
    );
  }
}

/*
路由传值，对应组件不用先定义要接受的值，直接通过Get.parameters['key']获取即可

中间件，匹配路由前后可以做的操作，比如权限验证，打印日志等
*/
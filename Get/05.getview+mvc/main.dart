import 'package:flutter/material.dart';
import './routers/routers.dart';

import 'package:get/get.dart';

import './binding/binding.dart';

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
      initialBinding: AllControllerBinding(),   //全局绑定GetxController
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          )),
      initialRoute: "/",      
      defaultTransition: Transition.rightToLeft,
      getPages:AppPage.routes,
    );
  }
}

/*
只用一个控制器，就可以getview替代stateless，这样就不用写find了
注意 没有binding还是需要写put
可以在一个binding写全，也可以分开写，路由文件中写binding

但实际中一个页面可能有多个控制器，所以，意义不大

shop展示

控制器也有生命周期函数
这类似于mvc，一个控制器对应一个页面，但是这个控制器可以在多个页面使用。对于前端程序员来说比较陌生
因为使用了getview，不是flutter的state，所以没有flutter的钩子，需要控制器的钩子

使用了find，即使当前页面返回，控制器也不会销毁，只有调用close才会销毁。使用了getview，路由绑定的控制器会自动销毁
*/
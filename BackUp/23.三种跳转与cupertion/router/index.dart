// import 'package:flutter/material.dart';
import '../Pages/tabs.dart';
import '../Pages//homesearch.dart';
import '../Pages//form.dart';

// 让ios和安卓的风格一致 左右滑动
import 'package:flutter/cupertino.dart'; // importc

Map routes = {
  '/': (context) => BaseComponent(),
  '/form': (context) => FormPage(),
  '/homeSearch': (context, {arguments}) => HomeSearchPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
      builder: (context) =>
      pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
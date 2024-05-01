import 'package:get/get.dart';
import '../pages/tabs.dart';
import '../pages/shop.dart';
import '../pages/search.dart';
import '../binding/shop.dart';
import '../binding/search.dart';
import '../middlewares/shopMiddleware.dart';

class AppPage {
  static final routes = [
    GetPage(name: "/", page: () => const Tabs()),
    GetPage(
        name: "/shop",
        page: () => const ShopPage(),
        binding: ShopControllerBinding(),
        middlewares: [ShopMiddleWare()]),
    GetPage(
        name: "/search",
        binding: SearchControllerBinding(),
        page: () => const SearchPage()),
  ];
}

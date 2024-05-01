import 'package:get/get.dart';

import '../controllers/counter.dart';
import '../controllers/list.dart';
class AllControllerBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<ListController>(() => ListController());
  }

}
/*
main中引入并initialbinding
home直接使用get.find 无需再次实例化

之前没binding 现在a初始化 b中find；如果先加载b，那么b中的find会找不到a

现在有bind，无需初始化，所有组件直接find即可
*/
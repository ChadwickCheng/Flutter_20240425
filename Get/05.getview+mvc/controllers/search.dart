import 'package:get/get.dart';

class SearchController extends GetxController {
  RxList hotList=[].obs;

  void onInit() {
    print("请求接口数据");
    getHotList(); 
    super.onInit();
  }

  @override
  void onClose() {
    print("onClose");
    super.onClose();
  }

  void getHotList() {  
    hotList.add("我是一个模拟的数据");
    update();
  }
}

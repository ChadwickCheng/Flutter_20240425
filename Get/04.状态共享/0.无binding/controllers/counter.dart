import 'package:get/get.dart';

class CounterController extends GetxController{
    RxInt counter=0.obs;

    void inc(){
      counter.value++;
      update();
    }
    void dec(){
      counter.value--;
      update();
    }
}

/*
get状态管理本质是streamBuilder
home cate shop中展示
home创建 get获取

缺点 每次都要创建控制器 麻烦 使用binding 参考另一个demo
*/
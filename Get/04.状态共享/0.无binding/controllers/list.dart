import 'package:get/get.dart';

class ListController extends GetxController{
    RxList list=[].obs;

    void add(value){
      list.add(value);
      update();
    }
   
}
/*
设置与用户显示

可以lazyput实现懒加载
*/
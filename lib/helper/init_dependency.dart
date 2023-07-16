import 'package:get/get.dart';
import 'package:getx_demo/controller/increment_controller.dart';
import 'package:getx_demo/controller/list_controller.dart';

class InitDept extends Bindings{
  @override
  void dependencies() {
    Get.put(IncrementController());
    Get.put(ListController());
  }
}
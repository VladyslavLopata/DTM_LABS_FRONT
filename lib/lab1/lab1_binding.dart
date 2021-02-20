import 'package:dtm_front/lab1/lab1_controller.dart';
import 'package:get/get.dart';

class AppFrontBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Lab1Controller());
  }
}

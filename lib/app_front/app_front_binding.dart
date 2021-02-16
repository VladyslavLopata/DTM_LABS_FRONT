import 'package:dtm_front/app_front/app_front_controller.dart';
import 'package:get/get.dart';

class AppFrontBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppFrontController());
  }
}

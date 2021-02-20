import 'package:dtm_front/services/request_service.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestService());
  }
}

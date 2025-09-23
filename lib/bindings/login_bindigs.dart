import 'package:flutter_project_1/controller/newlogin_controller.dart';
import 'package:get/get.dart';

class LoginBindig extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewloginController>(() => NewloginController());
  }
}

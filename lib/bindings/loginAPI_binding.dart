import 'package:flutter_project_1/controller/loginAPI_controller.dart';
import 'package:get/get.dart';

class LoginapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginapiController>(() => LoginapiController());
  }
}
import 'package:flutter_project_1/controller/example_controller.dart';
import 'package:get/get.dart';

class ExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}
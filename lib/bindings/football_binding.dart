import 'package:flutter_project_1/controller/football_controller.dart';
import 'package:get/get.dart';

class FootballBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(FootballController());
  }

}
import 'package:flutter_project_1/controller/football_edit_controller.dart';
import 'package:get/get.dart';

class FootballEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FootballEditController>(() => FootballEditController());
  }
}

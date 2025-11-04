import 'package:flutter_project_1/controller/premier_table_controller.dart';
import 'package:get/get.dart';

class PremierBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PremierTableController>(() => PremierTableController());
  }
  
}
import 'package:flutter_project_1/controller/calculator_controller.dart';
import 'package:get/get.dart';

class CalculatroBinding extends Bindings{

  @override
  void dependencies() {
    //only called when needed
    Get.put(CalculatorController());
  }
  
}
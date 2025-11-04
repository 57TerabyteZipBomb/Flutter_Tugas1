import 'package:flutter_project_1/controller/FCM_controller.dart';
import 'package:flutter_project_1/controller/example_controller.dart';
import 'package:flutter_project_1/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_project_1/controller/navigation_controller.dart';
import 'package:flutter_project_1/controller/calculator_controller.dart';
import 'package:flutter_project_1/controller/football_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<CalculatorController>(() => CalculatorController());
    Get.lazyPut<FootballController>(() => FootballController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ExampleController>(() => ExampleController());
    Get.lazyPut<FcmController>(() => FcmController());
    //Get.lazyPut<ContactController>(() => ContactController());
  }
}
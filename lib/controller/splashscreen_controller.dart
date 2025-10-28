import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    checkLogin();
  }

  checkLogin()async{
    final prefs = await SharedPreferences.getInstance();
    final savedtoken = prefs.getString('token');
    await Future.delayed(Duration(seconds: 3));
    if (savedtoken != null && savedtoken.isNotEmpty) {
      Get.offAllNamed(AppRoutes.main);
    } else {
      Get.offAllNamed(AppRoutes.loginapi);
    }
  }
}
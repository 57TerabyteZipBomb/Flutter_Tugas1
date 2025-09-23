import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // remove all saved keys
    Get.offAllNamed(AppRoutes.login); // go back to login screen
  }
}
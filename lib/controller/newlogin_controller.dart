import 'package:flutter/widgets.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewloginController extends GetxController {

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String username = "admin";

  login()async{
    if (user.text.toString() == username && pass.text.toString() == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", username);
      Get.offAllNamed(AppRoutes.main);
    } else {
      Get.snackbar("error", "incorrect username/password");
    }
  }
}
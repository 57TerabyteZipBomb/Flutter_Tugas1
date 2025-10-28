import 'package:flutter/material.dart';
import 'package:flutter_project_1/api/clinetnetwork.dart';
import 'package:flutter_project_1/models/login_model.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginapiController extends GetxController {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  RxBool isLoading = false.obs;

  void loginAPI() async {
    isLoading.value = true;
    try {
      final response = await ClientNetwork.postData("latihan/login", {
        "username": user.text,
        "password": pass.text,
      });

      if (response.statusCode == 200) {
        final result = loginModelFromJson(response.body);

        if (result.status) {
          Get.snackbar("Success", "Login successful: ${result.message}");
          print("Token: ${result.token}");

          final prefs = await SharedPreferences.getInstance();
          prefs.setString("token", result.token.toString());
          Get.offAllNamed(AppRoutes.main);
        } else {
          Get.snackbar("Failed", result.message);
        }
      } else {
        Get.snackbar("Error", "Server error: ${response.statusCode}");
        print(response.statusCode);
      }
    } catch (e) {
      Get.snackbar("Error", "Exception: $e");
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}

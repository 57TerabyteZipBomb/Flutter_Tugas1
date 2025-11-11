import 'package:flutter/material.dart';
import 'package:flutter_project_1/api/clinetnetwork.dart';
import 'package:flutter_project_1/models/login_model.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginapiController extends GetxController {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  RxBool isLoading = false.obs;

  Rx<User?> firebaseUser = Rx<User?>(null);

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
    }
    isLoading.value = false;
  }

  Future<void> loginWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId: "69670740953-9f1bgh6klqlvsjefl538j31q2p08f165.apps.googleusercontent.com",
      );

      final GoogleSignInAccount account = await GoogleSignIn.instance
          .authenticate();
      final idToken = account.authentication.idToken;

      final credential = GoogleAuthProvider.credential(idToken: idToken);
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      firebaseUser.value = userCredential.user;

      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", idToken ?? "");

      Get.snackbar(
        "Success",
        "Logged in as ${firebaseUser.value?.displayName}",
      );
      Get.offAllNamed(AppRoutes.main);
    } catch (e) {
      Get.snackbar("Google Login Failed", "$e");
      print(e);
    }
  }
}

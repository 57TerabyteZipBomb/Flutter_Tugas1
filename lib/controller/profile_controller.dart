import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  Rx<User?> firebaseUser = Rx<User?>(FirebaseAuth.instance.currentUser);

  String get username => firebaseUser.value?.displayName ?? "Random Dude";
  String get email => firebaseUser.value?.email ?? "WhoThe.HellIs@This.Bro";
  String get photoUrl => firebaseUser.value?.photoURL ?? "";

  logout() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn.instance.signOut();

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    Get.offAllNamed(AppRoutes.splash);
  }
}
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FcmController extends GetxController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    requestPermissions();
    getDeviceToken();
    handleForegroundMessages();
  }

  void requestPermissions() async {
    await _messaging.requestPermission();
  }

  void getDeviceToken() async {
    String? token = await _messaging.getToken();
    print("FCM Token: $token");
  }

  void handleForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message: ${message.notification?.title}");
    });
  }
}
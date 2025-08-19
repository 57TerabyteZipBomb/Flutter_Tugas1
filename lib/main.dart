import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/football_controller.dart';
import 'package:flutter_project_1/controller/football_edit_controller.dart';
import 'package:flutter_project_1/controller/navigation_controller.dart';
import 'package:flutter_project_1/pages/main_page.dart';
import 'package:get/get.dart';

void main() {
  // Register controllers globally
  Get.lazyPut(() => NavigationController(), fenix: true);
  Get.lazyPut(() => FootballController(), fenix: true);
  Get.lazyPut(() => FootballEditController(), fenix: true);

  runApp(const MyApp());
}

//root
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainPage(),
    );
  }
}

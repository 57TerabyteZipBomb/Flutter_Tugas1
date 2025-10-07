import 'package:flutter/material.dart';
import 'package:flutter_project_1/routes/pages.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}

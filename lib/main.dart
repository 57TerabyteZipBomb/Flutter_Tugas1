import 'package:flutter/material.dart';
import 'package:flutter_project_1/pages/calculator_page.dart';
//import 'package:flutter_project_1/login_page.dart';
import 'package:get/get.dart';

void main() {
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
      home: CalculatorPage(),
    );
  }
}

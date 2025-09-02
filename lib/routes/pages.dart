import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_project_1/pages/main_page.dart';
import 'package:flutter_project_1/pages/calculator_page.dart';
import 'package:flutter_project_1/pages/football_pages.dart';
import 'package:flutter_project_1/pages/football_edit_page.dart';
import 'package:flutter_project_1/pages/profile_page.dart';

import 'package:flutter_project_1/bindings/main_binding.dart';
import 'package:flutter_project_1/controller/football_edit_controller.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.main,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.footballedit,
      page: () => FootballEditPage(),
      binding: BindingsBuilder(() {
        Get.put(FootballEditController());
      }),
    ),
    // These are still declared for navigation flexibility,
    // but CalculatorController & FootballController are now provided by MainBinding.
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
  ];
}
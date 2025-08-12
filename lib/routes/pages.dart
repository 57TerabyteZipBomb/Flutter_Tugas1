import 'package:flutter_project_1/pages/calculator_page.dart';
import 'package:flutter_project_1/pages/football_edit_page.dart';
import 'package:flutter_project_1/pages/football_pages.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/route_manager.dart';

class AppPages{
  // list/array of pages
  static final pages = [
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage()),
    GetPage(name: AppRoutes.footballedit, page: () => FootballEditPage()),
  ];
}
import 'package:flutter_project_1/bindings/calculator_binding.dart';
import 'package:flutter_project_1/bindings/contact_binding.dart';
import 'package:flutter_project_1/bindings/example_binding.dart';
import 'package:flutter_project_1/bindings/football_binding.dart';
import 'package:flutter_project_1/bindings/loginAPI_binding.dart';
import 'package:flutter_project_1/bindings/login_bindigs.dart';
import 'package:flutter_project_1/bindings/premier_binding.dart';
import 'package:flutter_project_1/bindings/profile_binding.dart';
import 'package:flutter_project_1/bindings/splashscreen_binding.dart';
import 'package:flutter_project_1/pages/contact_page.dart';
import 'package:flutter_project_1/pages/example_page.dart';
import 'package:flutter_project_1/pages/football_page.dart';
import 'package:flutter_project_1/pages/loginAPI_page.dart';
import 'package:flutter_project_1/pages/newlogin_page.dart';
import 'package:flutter_project_1/pages/premier_table.dart';
import 'package:flutter_project_1/pages/splashscreen_page.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_project_1/pages/main_page.dart';
import 'package:flutter_project_1/pages/calculator_page.dart';
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
    GetPage(name: AppRoutes.calculator, page: () => CalculatorPage(), binding: CalculatroBinding()),
    GetPage(name: AppRoutes.footballplayers, page: () => FootballPage(), binding: FootballBinding()),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage(), binding: ProfileBinding()),
    GetPage(name: AppRoutes.splash, page: () => SplashscreenPage(), binding: SplashscreenBinding()),
    GetPage(name: AppRoutes.login, page: () => NewloginPage(), binding: LoginBindig()),
    GetPage(name: AppRoutes.contact, page: () => ContactPage(), binding: ContactBinding()),
    GetPage(name: AppRoutes.example, page: () => ExamplePage(), binding: ExampleBinding()),
    GetPage(name: AppRoutes.loginapi, page: () => LoginapiPage(), binding: LoginapiBinding()),
    GetPage(name: AppRoutes.premiertable, page: () => PremierTablePage(), binding: PremierBinding()),
  ];
}
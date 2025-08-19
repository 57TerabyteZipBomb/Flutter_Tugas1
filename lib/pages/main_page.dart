import 'package:flutter/material.dart';
import 'package:flutter_project_1/pages/profile_page.dart';
import 'package:get/get.dart';
import 'package:flutter_project_1/controller/navigation_controller.dart';
import 'package:flutter_project_1/pages/calculator_page.dart';
import 'package:flutter_project_1/pages/football_pages.dart';
import 'package:flutter_project_1/pages/football_edit_page.dart';

class MainPage extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> pages = [
    CalculatorPage(),
    FootballPage(),
    FootballEditPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: navController.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
          selectedItemColor: Colors.green[700],
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Calculator",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Players"),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

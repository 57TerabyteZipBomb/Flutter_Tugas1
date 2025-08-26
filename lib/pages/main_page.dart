import 'package:flutter/material.dart';
import 'package:flutter_project_1/pages/profile_page.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_project_1/controller/navigation_controller.dart';
import 'package:flutter_project_1/pages/calculator_page.dart';
import 'package:flutter_project_1/pages/football_pages.dart';
import 'package:flutter_project_1/pages/football_edit_page.dart';

class MainPage extends StatelessWidget {
  final NavigationController navController = Get.put(NavigationController());

  final List<Widget> pages = [CalculatorPage(), FootballPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Obx(() {
            TextStyle the = TextStyle(fontWeight: FontWeight.bold);
            switch (navController.currentIndex.value) {
              case 0:
                return Text("calc", style: the,);
              case 1:
                return Text("fooball", style: the,);
              case 2:
                return Text("profiler", style: the,);
              default:
                return Text("cool app", style: the,);
            }
          }),
          backgroundColor: Colors.green[700],
          centerTitle: true,
          elevation: 2,
        ),

        body: IndexedStack(
          index: navController.currentIndex.value,
          children: pages,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Profile info (hardcoded)
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green[700]),
                accountName: const Text("John Doe"),
                accountEmail: const Text("john.doe@email.com"),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/awesome.png"),
                ),
              ),

              // Sidebar tabs
              ListTile(
                leading: Icon(Icons.calculate),
                title: const Text("Calculator"),
                onTap: () {
                  navController.changePage(0);
                  Navigator.pop(context); // close drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: const Text("Football Players"),
                onTap: () {
                  navController.changePage(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  navController.changePage(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
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
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}

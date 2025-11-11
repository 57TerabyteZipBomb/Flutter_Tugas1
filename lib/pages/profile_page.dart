import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/profile_controller.dart';
import 'package:flutter_project_1/widgets/widget_button.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: controller.photoUrl.isNotEmpty
                    ? NetworkImage(controller.photoUrl)
                    : const AssetImage("assets/awesome.png") as ImageProvider,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              controller.username,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              controller.email,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),

            const SizedBox(height: 24),

            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.school, color: Colors.green),
                title: Text("11 PPLG 1"),
                subtitle: Text("Absen 15"),
              ),
            ),

            const SizedBox(height: 16),

            CustomButton(onPressed: controller.logout, text: 'Log Out'),
          ],
        ),
      ),
    );
  }
}

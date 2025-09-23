import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/newlogin_controller.dart';
import 'package:flutter_project_1/widgets/widget_button.dart';
import 'package:flutter_project_1/widgets/widget_textfield_awesome.dart';
import 'package:get/get.dart';

class NewloginPage extends StatelessWidget {
  NewloginPage({super.key});

  final NewloginController controller = Get.find<NewloginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),

            MyOtherTextField(
              textEditingController: controller.user,
              label: "Username",
            ),
            const SizedBox(height: 20),

            MyOtherTextField(
              textEditingController: controller.pass,
              label: "Password",
              isObscured: true,
            ),
            const SizedBox(height: 30),

            CustomButton(
              text: "Login",
              textcolor: Colors.white,
              onPressed: () {
                controller.login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
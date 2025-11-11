import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/loginAPI_controller.dart';
import 'package:flutter_project_1/widgets/widget_button.dart';
import 'package:flutter_project_1/widgets/widget_textfield_awesome.dart';
import 'package:get/get.dart';

class LoginapiPage extends StatelessWidget {
  LoginapiPage({super.key});

  final LoginapiController controller = Get.find<LoginapiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sybau')),
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
            //change between loading circle and button based on isloading
            Obx(
              () => controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: "Login",
                      textcolor: Colors.white,
                      onPressed: () {
                        controller.loginAPI();
                      },
                    ),
            ),
            const SizedBox(height: 30),

            CustomButton(
              text: "Login with Google",
              textcolor: Colors.white,
              onPressed: controller.loginWithGoogle,
            ),
          ],
        ),
      ),
    );
  }
}

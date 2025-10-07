import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/example_controller.dart';
import 'package:flutter_project_1/pages/mobile/example_moblie.dart';
import 'package:flutter_project_1/pages/widescreen/example_widescreen.dart';
import 'package:get/get.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          //detect screen width, change value of isMobile
          controller.updateLayout(constraints);
          //change screen based on isMobile value
          return Obx(()=>controller.isMobile.value ? ExampleMoblie() : ExampleWidescreen());
        },
      ),
    );
  }
}

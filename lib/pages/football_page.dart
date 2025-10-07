import 'package:flutter/material.dart';
import 'package:flutter_project_1/pages/mobile/football_page_mobile.dart';
import 'package:flutter_project_1/pages/widescreen/football_page_widescreen.dart';
import 'package:get/get.dart';

import '../controller/example_controller.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});

  final controller = Get.find<ExampleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          //detect screen width, change value of isMobile
          controller.updateLayout(constraints);
          //change screen based on isMobile value
          return Obx(()=>controller.isMobile.value ? FootballPageMobile() : FootballPageWidescreen());
        },
      ),
    );
  }
}
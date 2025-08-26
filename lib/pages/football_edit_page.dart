import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/football_edit_controller.dart';
import 'package:flutter_project_1/widgets/widget_button.dart';
import 'package:flutter_project_1/widgets/widget_textfield_awesome.dart';
import 'package:get/get.dart';

//argghhh
class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final editController = Get.find<FootballEditController>();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('edit yo fooball', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            MyOtherTextField(
              textEditingController: editController.nameController,
              label: 'Name',
              isObscured: false,
              onChanged: editController.updateName,
            ),

            const SizedBox(height: 16),

            MyOtherTextField(
              textEditingController: editController.positionController,
              label: 'Position',
              isObscured: false,
              onChanged: editController.updatePosition,
            ),

            const SizedBox(height: 16),

            MyOtherTextField(
              textEditingController: editController.numberController,
              label: 'Number',
              isObscured: false,
              onChanged: editController.updateNumber,
            ),

            const SizedBox(height: 24),

            CustomButton(
              text: 'Save Changes',
              textcolor: Colors.white,
              onPressed: () {
                editController.saveChanges();
              },
            ),
          ],
        ),
      ),
    );
  }
}

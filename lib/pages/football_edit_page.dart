import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/football_edit_controller.dart';
import 'package:flutter_project_1/widgets/widget_button.dart';
import 'package:flutter_project_1/widgets/widget_textfield_awesome.dart';
import 'package:get/get.dart';

//argghhh
class FootballEditPage extends StatelessWidget {
  const FootballEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    //this thingy
    final editController = Get.put(FootballEditController());

    //controllers, which also has text auto assigned when opening (wow)
    final nameController = TextEditingController(
      text: editController.player.value.name,
    );
    final positionController = TextEditingController(
      text: editController.player.value.position,
    );
    final numberController = TextEditingController(
      text: editController.player.value.number.toString(),
    );

    //scaff old
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('edit yo fooball'),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            
            //name input
            MyOtherTextField(
              textEditingController: nameController,
              label: 'Name',
              isObscured: false,
              onChanged: editController.updateName,
            ),

            const SizedBox(height: 16),

            //position input
            MyOtherTextField(
              textEditingController: positionController,
              label: 'Position',
              isObscured: false,
              onChanged: editController.updatePosition,
            ),

            const SizedBox(height: 16),

            //back number input
            MyOtherTextField(
              textEditingController: numberController,
              label: 'Number',
              isObscured: false,
              onChanged: editController.updateNumber,
            ),
            
            const SizedBox(height: 24),

            //save button
            CustomButton(
              text: 'Save Changes',
              textcolor: Colors.white,
              onPressed: () {
                editController.saveChanges();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

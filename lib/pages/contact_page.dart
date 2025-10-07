import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/contact_controller.dart';
import 'package:flutter_project_1/widgets/widget_button.dart';
import 'package:flutter_project_1/widgets/widget_coolcard.dart';
import 'package:flutter_project_1/widgets/widget_textfield_awesome.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final ContactController contactController = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    final usernamer = contactController.usernameController;

    //ourghhhhh
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MyOtherTextField(
                    textEditingController: usernamer,
                    label: 'Username',
                  ),
                ),
                const SizedBox(width: 12),
                CustomButton(
                  text: 'Add',
                  onPressed: () {
                    final name = contactController.usernameController.text;
                    contactController.addContact(name);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: contactController.contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contactController.contacts[index];
                    return CoolCard(name: contact, index: index,);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

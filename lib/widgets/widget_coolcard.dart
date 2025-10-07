import 'package:flutter/material.dart';
import 'package:flutter_project_1/controller/contact_controller.dart';
import 'package:get/get.dart';

class CoolCard extends StatelessWidget {
  final String name;
  final int index; // Needed to identify which contact
  final ContactController controller = Get.find<ContactController>();

  CoolCard({
    super.key, 
    required this.name, 
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          child: Text(name[0].toUpperCase()),
          backgroundColor: Colors.green[700],
          foregroundColor: Colors.white,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Delete
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                controller.deleteContact(index);
              },
            ),
          ],
        ),
        // Edit
        onTap: () {
          _showEditDialog(context);
        },
      ),
    );
  }

  //func tion
  void _showEditDialog(BuildContext context) {
    //the text controller
    final editController = TextEditingController(text: name);

    //dialogue filled with stuff
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Contact'),
        content: TextField(
          controller: editController,
          decoration: const InputDecoration(labelText: 'Username'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          //save button
          ElevatedButton(
            onPressed: () {
              final newName = editController.text.trim();
              if (newName.isNotEmpty) {
                controller.updateContact(index, newName);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
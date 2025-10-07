import 'package:flutter/material.dart';
import 'package:flutter_project_1/helper/database_helper.dart';
import 'package:get/get.dart';

class ContactController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final contacts = <String>[].obs; // This will hold contacts from DB
  final DBHelper _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchContacts(); //load from DB when controller is initialized
  }

  Future<void> fetchContacts() async {
    final data = await _dbHelper.getNames();
    contacts.value = data.map((e) => e['name'] as String).toList();
  }

  Future<void> addContact(String name) async {
    if (name.trim().isEmpty) return;
    await _dbHelper.insertName(name);
    usernameController.clear();
    fetchContacts();
  }

  Future<void> deleteContact(int index) async {
    final data = await _dbHelper.getNames();
    final id = data[index]['id'] as int;
    final db = await _dbHelper.db;
    await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
    fetchContacts();
  }

  Future<void> updateContact(int index, String newName) async {
    final data = await _dbHelper.getNames();
    final id = data[index]['id'] as int;
    final db = await _dbHelper.db;
    await db.update(
      'contacts',
      {'name': newName},
      where: 'id = ?',
      whereArgs: [id],
    );
    fetchContacts();
  }

  @override
  void onClose() {
    usernameController.dispose();
    super.onClose();
  }
}

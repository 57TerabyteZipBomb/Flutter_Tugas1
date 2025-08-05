import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  final TextEditingController textEditingController;
  final String label;
  final bool isObscured;

  const MyTextField({super.key, required this.textEditingController, required this.label, required this.isObscured});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscured,
      decoration: InputDecoration(label: Text(label), border: const OutlineInputBorder(),),
      controller: textEditingController
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//this file contains the page logic
class CalculatorController extends GetxController {
  //controllering
  final TextEditingController txtNum1 = TextEditingController();
  final TextEditingController txtNum2 = TextEditingController();
  //Rx = reactive variable
  //adding .obs onto a variable makes it "reactive", which instantly updates related controllers when the variable is changed
  //getX has several predifined Rx types for common variable types (such as RxString or RxInt), so in this case .obs is redundant
  final RxString result = ''.obs;

  // Parse method, to parse from input String to double
  double? _parse(String s) {
    final trimmed = s.trim();
    if (trimmed.isEmpty) return null;
    return double.tryParse(trimmed);
  }

  // Result format method
  String _format(double value) {
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      return value.toStringAsFixed(10);
    }
  }

  //arithmetic methods wow

  //general structure
  void add() {
    //variables to add
    final n1 = _parse(txtNum1.text);
    final n2 = _parse(txtNum2.text);
    //if one of the variables are null, update result Rx accordingly
    if (n1 == null || n2 == null) {
      result.value = 'invalid numbers';
      return;
    }
    //set result Rx to the arithmetic result of n1 and n2
    result.value = _format(n1 + n2);
  }

  void minus() {
    final n1 = _parse(txtNum1.text);
    final n2 = _parse(txtNum2.text);
    if (n1 == null || n2 == null) {
      result.value = 'invalid numbers';
      return;
    }
    result.value = _format(n1 - n2);
  }

  void mult() {
    final n1 = _parse(txtNum1.text);
    final n2 = _parse(txtNum2.text);
    if (n1 == null || n2 == null) {
      result.value = 'invalid numbers';
      return;
    }
    result.value = _format(n1 * n2);
  }

  void divide() {
    final n1 = _parse(txtNum1.text);
    final n2 = _parse(txtNum2.text);
    if (n1 == null || n2 == null) {
      result.value = 'invalid numbers';
      return;
    }
    if (n2 == 0) {
      result.value = 'Cant divide by zero pluh';
      return;
    }
    result.value = _format(n1 / n2);
  }

  void clear() {
    txtNum1.clear();
    txtNum2.clear();
    result.value = '';
  }

  @override
  void onClose() {
    // Important: dispose controllers to free resources
    txtNum1.dispose();
    txtNum2.dispose();
    super.onClose();
  }
}

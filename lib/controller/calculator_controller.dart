import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController{
  final TextEditingController txtNum1 = TextEditingController();
  final TextEditingController txtNum2 = TextEditingController();
  var result = "".obs;

  void add(){
    int num1 = int.parse(txtNum1.text.toString());
    int num2 = int.parse(txtNum2.text.toString());
    int resultNum = num1+num2;
    result.value = resultNum.toString();
  }

  void minus(){
    int num1 = int.parse(txtNum1.text.toString());
    int num2 = int.parse(txtNum2.text.toString());
    int resultNum = num1-num2;
    result.value = resultNum.toString();
  }

  void mult(){
    int num1 = int.parse(txtNum1.text.toString());
    int num2 = int.parse(txtNum2.text.toString());
    int resultNum = num1*num2;
    result.value = resultNum.toString();
  }

  void divide(){
    int num1 = int.tryParse(txtNum1.text) ?? 0;
    int num2 = int.tryParse(txtNum2.text) ?? 1;
    if (num2 == 0){
      result.value = 'dont';
    } else {
      result.value = (num1/num2).toStringAsFixed(2);
    }
  }

  void clear(){
    txtNum1.clear();
    txtNum2.clear();
    result.value = '';
  }
}
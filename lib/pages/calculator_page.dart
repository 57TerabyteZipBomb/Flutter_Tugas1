import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project_1/controller/calculator_controller.dart';
import 'package:flutter_project_1/widgets/widget_button.dart';
import 'package:flutter_project_1/widgets/widget_textfield.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            MyTextField(
              textEditingController: calculatorController.txtNum1,
              label: 'Input 1',
              isObscured: false,
            ),

            const SizedBox(height: 20),

            MyTextField(
              textEditingController: calculatorController.txtNum2,
              label: 'Input 2',
              isObscured: false,
            ),

            const SizedBox(height: 20),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: '+',
                      textcolor: Colors.blue,
                      onPressed: () {calculatorController.add();},
                    ),
                    CustomButton(
                      text: '-',
                      textcolor: Colors.blue,
                      onPressed: () {calculatorController.minus();},
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: 'x',
                      textcolor: Colors.blue,
                      onPressed: () {calculatorController.mult();},
                    ),
                    CustomButton(
                      text: '/',
                      textcolor: Colors.blue,
                      onPressed: () {calculatorController.divide();},
                    ),
                  ],
                ),
              ],
            ),

            const Text('hasil'),
            Obx(
              () => Text(
                calculatorController.result.value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: 'Clear',
              textcolor: Colors.red,
              onPressed: () {calculatorController.clear();},
            ),
          ],
        ),
      ),
    );
  }
}

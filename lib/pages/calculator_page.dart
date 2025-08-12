import 'package:flutter/material.dart';
import 'package:flutter_project_1/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_project_1/controller/calculator_controller.dart';
import 'package:flutter_project_1/widgets/widget_button.dart';
import 'package:flutter_project_1/widgets/widget_textfield.dart';

//this file contains the page UI/Style
class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  // idk what this does to be exact but i think its important
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
              //controllers are set as the ones defined in calculatorController
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

            //buttons and such
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //general sturcutre
                    CustomButton(
                      //decor stuff
                      text: '+',
                      textcolor: Colors.white,
                      //on pressed: calls the corresponding method on calculatorController
                      //this will update the "result" variable which in turn updates the result text, because Rx and Obx stuff ig
                      onPressed: () {
                        calculatorController.add();
                      },
                    ),
                    CustomButton(
                      text: '-',
                      textcolor: Colors.white,
                      onPressed: () {
                        calculatorController.minus();
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: 'x',
                      textcolor: Colors.white,
                      onPressed: () {
                        calculatorController.mult();
                      },
                    ),
                    CustomButton(
                      text: '/',
                      textcolor: Colors.white,
                      onPressed: () {
                        calculatorController.divide();
                      },
                    ),
                  ],
                ),
              ],
            ),

            //uhh this is unrelated its just a label on top of the actual result
            const Text('hasil:'),

            //Obx will instantly update the text when result in caluclatorController changes
            //IMPORTANT: each time an Rx changes values, Obx will instantly update
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
              textcolor: Colors.white,
              onPressed: () {
                calculatorController.clear();
              },
            ),

            //ts important
            CustomButton(
              text: 'Go To Football Player Page',
              textcolor: Colors.white,
              onPressed: () {
                Get.toNamed(AppRoutes.footballplayers);
              },
            ),
          ],
        ),
      ),
    );
  }
}

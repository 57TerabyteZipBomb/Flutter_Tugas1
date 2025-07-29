import 'package:flutter/material.dart';

//Constructor
class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Controllers
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _resultController = TextEditingController();

  //Clear text field function
  void _clearFields() {
    _controller1.clear();
    _controller2.clear();
    _resultController.clear();
  }

  //Calculate function, changes operation type based on passed symbol
  void _calculate(String operation) {
    final num1 = double.tryParse(_controller1.text);
    final num2 = double.tryParse(_controller2.text);

    if (num1 == null || num2 == null) {
      _resultController.text = "Please enter both numbers.";
      return;
    }

    double result;

    //Awesome switch case
    switch (operation) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '×':
        result = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          _resultController.text = "Cannot divide by zero.";
          return;
        }
        result = num1 / num2;
        break;
      default:
        _resultController.text = "Unknown operation.";
        return;
    }

    _resultController.text = result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Display name
        title: Text('Welcome, ${widget.userName}!'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //Input for first number
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'First Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            //Input for second number
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Second Number',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            //Operation button row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('×'),
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('÷'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //Result field
            TextField(
              controller: _resultController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Result',
                border: OutlineInputBorder(),
              ),
            ),
            
            const SizedBox(height: 20),

            //Clear button
            ElevatedButton(
              onPressed: _clearFields,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Cardproduct extends StatelessWidget {
  const Cardproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("what"),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Container(
                  height: 200,
                  color: Color.fromARGB(255, 66, 66, 66)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
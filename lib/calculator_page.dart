import 'package:flutter/material.dart';
import 'calculator/scientificCalculator.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    ),
  );
}

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:
                ScientificCalculator(), // ScientificCalculator as the main content
          ),
        ],
      ),
    );
  }
}

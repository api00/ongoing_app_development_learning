import 'package:flutter/material.dart';

/// This is a Flutter app to calculate the factorial of a number.
///
/// The app allows users to input a number and calculates its factorial.
/// It includes error handling for non-numeric inputs and negative numbers.
///
/// The factorial of a non-negative integer n, denoted as n!, is the product
/// of all positive integers less than or equal to n.
///
/// Example: 5! = 5 * 4 * 3 * 2 * 1 = 120
///
/// Author: [API ALAM]
/// Version: 1.0.0
/// Date: [05.12.2023]
///

class BasicCalculator extends StatefulWidget {
  const BasicCalculator({super.key});

  @override
  State<StatefulWidget> createState() => _basicCalculator();
}

// ignore: camel_case_types
class _basicCalculator extends State<BasicCalculator> {
  late final TextEditingController _controller =
      TextEditingController(); // Initialize _controller

  int calculateFactorial(int number) {
    if (number == 0 || number == 1) {
      return 1;
    } else {
      int factorial = 1;
      for (int i = 2; i <= number; i++) {
        factorial *= i;
      }
      return factorial;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Factorial Calculator"),
          backgroundColor: Colors.amber,
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Enter a Number",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      int? number = int.tryParse(_controller.text);
                      if (number != null && number >= 0) {
                        int factorial = calculateFactorial(number);
                        _controller.clear();
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Factorial Result"),
                                content:
                                    Text('Factorial of $number is $factorial'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            });
                      }
                    },
                    child: const Text('Calculate Factorial'))
              ],
            ),
          ),
        ));
  }
}

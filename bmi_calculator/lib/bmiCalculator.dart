import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class bmiCalculator extends StatefulWidget {
  const bmiCalculator({super.key});

  @override
  State<bmiCalculator> createState() => _bmiCalculatorState();
}

class _bmiCalculatorState extends State<bmiCalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double _displayBMI = 0;
  String _bmiEvaluation = '';
  double bmi = 0;
  double calculateBMI(double height, double weight) {
    double heightInMeter = height / 100; // Convert height from cm to meters
    return weight / (heightInMeter * heightInMeter);
  }

  String evaluateBMI(double bmi) {
    if (bmi < 18.5) {
      return 'You are underweight. You may need to gain weight.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'You have a normal weight. Maintain your current weight.';
    } else if (bmi >= 25.0 && bmi < 29.9) {
      return 'You are overweight. You may need to lose weight.';
    } else {
      return 'You are obese. You may need to lose weight.';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _displayBMI = bmi;
      _bmiEvaluation = evaluateBMI(bmi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        foregroundColor: const Color.fromARGB(255, 252, 252, 252),
        backgroundColor: const Color.fromARGB(255, 70, 75, 84),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      10.0), // Border radius for rounded corners
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 200, // Set the desired height
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  _displayBMI.toStringAsFixed(1).toString(),
                                  style: const TextStyle(
                                      fontSize: 50), // Adjust font size as needed
                                ),
                                Text(
                                  _bmiEvaluation, // Your random text
                                  style: const TextStyle(
                                      fontSize: 16), // Adjust font size as needed
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: 'Enter Height (cm)',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255, 243, 241, 241),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 22, 22, 22),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                keyboardType: TextInputType.number, // Set numeric keyboard
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                  LengthLimitingTextInputFormatter(
                      4), // Limit total characters to 4 (including "cm")
                ],
                validator: (value) {
                  if (value != null &&
                      value.isNotEmpty &&
                      !value.endsWith('cm')) {
                    return 'Please enter a valid number followed by "cm"';
                  }
                  return null; // Return null for valid input
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: weightController,
                decoration: const InputDecoration(
                    labelText: 'Enter Weight (kg)',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Color.fromARGB(255, 243, 241, 241),
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 22, 22, 22),
                      fontWeight: FontWeight.w400,
                    )),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (heightController.text.isNotEmpty &&
                      weightController.text.isNotEmpty) {
                    double height = double.parse(heightController.text);
                    double weight = double.parse(weightController.text);

                    // Calculate BMI
                    double bmi = calculateBMI(height, weight);

                    // Set state to update the UI with the calculated BMI and evaluation
                    setState(() {
                      _displayBMI = bmi;
                      _bmiEvaluation = evaluateBMI(bmi);
                    });
                  } else {
                    // Show an error message or handle the case when fields are empty
                    print('Please fill in both height and weight fields.');
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 117, 118, 118)), // Background color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    // Padding
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
                    ),
                  ),
                ),
                child: const Text(
                  "Calculate BMI",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

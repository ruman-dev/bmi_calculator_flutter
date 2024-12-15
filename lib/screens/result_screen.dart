import 'package:bmi_calculator/screens/calculate_screen.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmiResult});

  final double bmiResult;

  String makeMessage(double result) {
    if (result < 16.5) {
      return 'Severely Underweight';
    } else if (result < 16.9) {
      return 'Moderately Underweight';
    } else if (result < 18.4) {
      return 'Mildly underweight';
    } else if (result < 24.9) {
      return 'Normal';
    } else if (result < 29.9) {
      return 'Overweight';
    } else if (result >= 30.0) {
      return 'Obese';
    }
    return 'BMI result not found. Please try again.';
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> instructMap = {
      'Severely Underweight':
          'Please consult a healthcare provider for proper guidance.',
      'Moderately Underweight':
          'Consider a nutritious diet to reach a healthier weight.',
      'Mildly Underweight': 'A balanced diet could help improve your weight.',
      'Normal': 'Keep up your healthy lifestyle and Be Careful!',
      'Overweight':
          'Regular exercise and a healthy diet can help you maintain a healthy weight.',
      'Obese':
          'Please consult a healthcare provider to manage your weight effectively.',
    };

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 122, 172, 119),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/heart_white.png',
                  height: 300,
                ),
                const SizedBox(height: 40),
                const Text(
                  'Your BMI',
                  style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  bmiResult.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 44,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(
                  makeMessage(bmiResult),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 35),
                Text(
                  instructMap[makeMessage(bmiResult)] ??
                      'No instruction found.',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CalculateScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'RECALCULATE',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 122, 172, 119),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

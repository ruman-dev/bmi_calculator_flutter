import 'package:bmi_calculator/screens/calculate_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/heart.png',
                  height: 300,
                ),
                const SizedBox(height: 40),
                const Text(
                  'Welcome to the',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'BMI Calculator App',
                  style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 122, 172, 119),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Use this app to calculate your Body Mass Index (BMI)',
                  style: TextStyle(
                      color: Color.fromARGB(255, 69, 69, 69), fontSize: 16),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CalculateScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 122, 172, 119),
                        ),
                        child: const Text(
                          'PROCEED',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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

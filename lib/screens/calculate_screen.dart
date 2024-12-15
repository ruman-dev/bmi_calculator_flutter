import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/screens/widgets/age_weight_widgets.dart';
import 'package:bmi_calculator/screens/widgets/gender_selection.dart';
import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  double bmiResult() {
    double finalHeight = height / 100;
    double bmiValue = weight / (finalHeight * finalHeight);

    return bmiValue;
  }

  int age = 22;
  int weight = 58;
  int height = 120;
  double currentHeight = 120.0;
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title
              const Center(
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                      fontSize: 38,
                      color: Color.fromARGB(255, 122, 172, 119),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),

              // Gender Selection Label
              const Center(
                child: Text(
                  'Select Gender',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 122, 172, 119),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Gender Selection Options
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 50, // Space between male and female
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'male';
                      });
                    },
                    child: GenderSelection(
                      gender: 'Male',
                      imgPath: 'assets/images/male.png',
                      isSelected: selectedGender == 'male',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'female';
                      });
                    },
                    child: GenderSelection(
                      gender: 'Female',
                      imgPath: 'assets/images/female.png',
                      isSelected: selectedGender == 'female',
                    ),
                  )
                ],
              ),
              const SizedBox(height: 60),

              //* AGE Section
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AgeWeightWidgets(
                            title: 'AGE',
                            indicator: 'age',
                            valueChanged: (newAge) {
                              setState(() {
                                age = newAge;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          AgeWeightWidgets(
                            title: 'WEIGHT (kg)',
                            indicator: 'weight',
                            valueChanged: (newWeight) {
                              setState(() {
                                weight = newWeight;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const  EdgeInsets.only(top: 20, bottom: 50),
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'HEIGHT (cm)',
                              style: TextStyle(
                                color: Color.fromARGB(255, 122, 172, 119),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                value: currentHeight,
                                label: currentHeight.round().toStringAsFixed(0),
                                divisions: 160,
                                min: 90,
                                max: 250,
                                onChanged: (newValue) {
                                  setState(() {
                                    currentHeight = newValue;
                                    height = currentHeight.toInt();
                                  });
                                },
                                activeColor:
                                    const Color.fromARGB(255, 122, 172, 119),
                                inactiveColor: Colors.grey[300],
                              ),
                            ),
                            Text(
                              '$height',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    double finalResult = bmiResult();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          bmiResult: finalResult,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 122, 172, 119),
                  ),
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

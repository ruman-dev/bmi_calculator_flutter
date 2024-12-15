import 'package:flutter/material.dart';

class AgeWeightWidgets extends StatefulWidget {
  const AgeWeightWidgets(
      {super.key,
      required this.title,
      required this.indicator,
      required this.valueChanged});

  final String title;
  final String indicator;
  final ValueChanged<int> valueChanged;

  @override
  State<AgeWeightWidgets> createState() => _AgeWeightWidgetsState();
}

int ageCount = 22;
int weightCount = 58;

class _AgeWeightWidgetsState extends State<AgeWeightWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Color.fromARGB(255, 122, 172, 119),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.indicator == 'age' ? '$ageCount' : '$weightCount',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.indicator == 'age') {
                      ageCount++;
                      widget.valueChanged(ageCount);
                    } else {
                      weightCount++;
                      widget.valueChanged(weightCount);
                    }
                  });
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromARGB(255, 122, 172, 119),
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (widget.indicator == 'age') {
                      if (ageCount == 0) {
                        ageCount = 0;
                      } else {
                        ageCount--;
                        widget.valueChanged(ageCount);
                      }
                    } else {
                      if (weightCount == 0) {
                        weightCount = 0;
                      } else {
                        weightCount--;
                        widget.valueChanged(weightCount);
                      }
                    }
                  });
                },
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromARGB(255, 122, 172, 119),
                  child: Text(
                    '-',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

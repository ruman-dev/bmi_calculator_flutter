import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  const GenderSelection(
      {super.key,
      required this.gender,
      required this.imgPath,
      required this.isSelected});

  final String gender;
  final String imgPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: isSelected
              ? Colors.red.shade300
              : const Color.fromARGB(255, 122, 172, 119),
          radius: 40,
          child: CircleAvatar(
            backgroundImage: AssetImage(imgPath),
            backgroundColor: Colors.white,
            radius: 35,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            gender,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}

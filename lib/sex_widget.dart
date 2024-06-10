import 'package:flutter/material.dart';

class SexWidget extends StatelessWidget {
  final String sex;
  final IconData icon;

  const SexWidget({super.key, required this.sex, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
        ),
        SizedBox(height: 15.0),
        Text(
          sex,
          style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}

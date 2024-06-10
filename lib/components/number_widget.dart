import 'package:flutter/material.dart';
import '../constants.dart';

class NumberWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const NumberWidget({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15.0),
        Text(
          title,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

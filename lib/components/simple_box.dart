import 'package:flutter/material.dart';

class SimpleBox extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  const SimpleBox({super.key, required this.colour, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
      height: 200,
      width: 170,
    );
  }
}

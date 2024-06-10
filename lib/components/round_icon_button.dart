import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints(minWidth: 50.0, minHeight: 50.0),
      onPressed: onPressed,
      elevation: 7.0,
    );
  }
}

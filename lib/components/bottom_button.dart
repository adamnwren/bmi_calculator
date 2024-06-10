import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.buttonTitle, required this.onTap});

  final VoidCallback? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: kPinkC,
        child: Center(
          child: Text(
            buttonTitle,
            style: kButtonStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 15.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
      onTap: onTap,
    );
  }
}

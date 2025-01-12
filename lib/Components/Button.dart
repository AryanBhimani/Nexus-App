import 'package:flutter/material.dart';
import 'package:nexusapp/Components/Colors.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback press;
  final Color color;
  final double width;
  final double height;

  const Button({
    super.key,
    required this.label,
    required this.press,
    this.color = primaryColor,
    this.width = double.infinity,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: press,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 2,
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: backgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}

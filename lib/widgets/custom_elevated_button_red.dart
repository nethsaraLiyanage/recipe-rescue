import 'package:flutter/material.dart';

class CustomElevatedButtonRED extends StatelessWidget {
  const CustomElevatedButtonRED({
    super.key,
    required this.onButtonPressed,
    required this.height,
    required this.width,
    required this.childWidget,
  });

  final void Function() onButtonPressed;
  final double height;
  final double width;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: Color.fromARGB(255, 234, 33, 33),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onButtonPressed,
        child: childWidget,
      ),
    );
  }
}

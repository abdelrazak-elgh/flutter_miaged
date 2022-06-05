import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NeumorphicTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Color backgroundColor;
  final Icon prefixIcon;
  final bool isObscure;
  Offset distance = const Offset(4, 4);
  Color lighterShadow = Colors.white;
  Color darkerShadow = Colors.grey.shade300;
  double blur = 15;

  NeumorphicTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    required this.backgroundColor,
    required this.isObscure,
    distance,
    lighterShadow,
    darkerShadow,
    blur,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
        boxShadow: myNeumorphism(
          distance: distance,
          lighterShadow: lighterShadow,
          darkerShadow: darkerShadow,
          blur: blur,
        ),
      ),
      child: Builder(
        builder: (context) {
          if (isObscure) {
            return TextField(
              obscureText: isObscure,
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: const Icon(Icons.visibility),
                border: InputBorder.none,
              ),
            );
          } else {
            return TextField(
              obscureText: isObscure,
              style: const TextStyle(color: Colors.black87),
              decoration: InputDecoration(
                labelText: labelText,
                hintText: hintText,
                prefixIcon: prefixIcon,
                border: InputBorder.none,
              ),
            );
          }
        },
      ),
    );
  }
}

List<BoxShadow> myNeumorphism(
    {required Offset distance,
    required Color lighterShadow,
    required Color darkerShadow,
    required double blur}) {
  return [
    BoxShadow(
      offset: -distance,
      color: lighterShadow,
      blurRadius: blur,
      spreadRadius: 1,
    ),
    BoxShadow(
      offset: distance,
      color: darkerShadow,
      blurRadius: blur,
      spreadRadius: 1,
    ),
  ];
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mvp1/presentation/commons/colors.dart';

class RoundedButton extends StatelessWidget {
  List<Color>? buttonColor;
  BorderRadius? buttonBorderRadius;
  double? buttonWidth;
  double? buttonHeight;
  double? textFontSize;
  IconData? buttonIcon;
  double? iconSize;
  final String buttonText;

  RoundedButton({
    Key? key,
    this.buttonColor,
    this.buttonBorderRadius,
    this.buttonWidth,
    this.buttonHeight,
    this.textFontSize,
    this.buttonIcon,
    this.iconSize,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: buttonColor ??= buttonColor1,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: buttonBorderRadius ??= BorderRadius.circular(12)),
      child: ElevatedButton(
        onPressed: () {},
        child: Builder(
          builder: (context) {
            if (buttonIcon != null) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(fontSize: textFontSize ??= 16.0),
                  ),
                  const SizedBox(width: 5),
                  Icon(buttonIcon, size: iconSize ??= 20.0)
                ],
              );
            } else {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(fontSize: textFontSize ??= 16.0),
                  ),
                ],
              );
            }
          },
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(buttonWidth ??= MediaQuery.of(context).size.width,
              buttonHeight ??= 50),
          shape: RoundedRectangleBorder(
            borderRadius: buttonBorderRadius ??= BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

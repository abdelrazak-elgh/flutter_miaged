// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomClipPath extends StatelessWidget {
  List<Color> listColor;
  Alignment begin;
  Alignment end;
  double coeffHeight;
  CustomClipper<Path> customClipper;

  CustomClipPath({
    Key? key,
    required this.listColor,
    required this.begin,
    required this.end,
    required this.coeffHeight,
    required this.customClipper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: customClipper,
      child: Container(
        height: MediaQuery.of(context).size.height * coeffHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: listColor,
            begin: begin,
            end: end,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mvp1/presentation/components/clip_path.dart';

class CustomShape extends StatelessWidget {
  final List<Color> listColor;
  final Alignment begin1;
  final Alignment end1;
  final Alignment begin2;
  final Alignment end2;
  final String customFont;
  final CustomClipper<Path> customClipper;
  Alignment? stackAlignment;
  double? firstHeightCoeff;
  double? secondHeightCoeff;
  double? thirdHeightCoeff;
  double? fourthHeightCoeff;
  double? fifthHeightCoeff;
  double? fontSize;
  double? topPosition;
  FontWeight? fontWeight;
  String? text;

  CustomShape(
      {Key? key,
      required this.listColor,
      required this.begin1,
      required this.end1,
      required this.begin2,
      required this.end2,
      required this.customFont,
      required this.customClipper,
      this.stackAlignment,
      this.firstHeightCoeff,
      this.secondHeightCoeff,
      this.thirdHeightCoeff,
      this.fourthHeightCoeff,
      this.fifthHeightCoeff,
      this.fontSize,
      this.topPosition,
      this.fontWeight,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: stackAlignment ??= Alignment.topCenter,
      children: <Widget>[
        Opacity(
            opacity: 0.2,
            child: CustomClipPath(
              listColor: listColor,
              begin: begin1,
              end: end1,
              coeffHeight: firstHeightCoeff ??= 0.32,
              customClipper: customClipper,
            )),
        Opacity(
          opacity: 0.4,
          child: CustomClipPath(
            listColor: listColor,
            begin: begin1,
            end: end1,
            coeffHeight: secondHeightCoeff ??= 0.325,
            customClipper: customClipper,
          ),
        ),
        Opacity(
            opacity: 0.6,
            child: CustomClipPath(
              listColor: listColor,
              begin: begin1,
              end: end1,
              coeffHeight: thirdHeightCoeff ??= 0.315,
              customClipper: customClipper,
            )),
        Opacity(
            opacity: 0.8,
            child: CustomClipPath(
              listColor: listColor,
              begin: begin1,
              end: end1,
              coeffHeight: fourthHeightCoeff ??= 0.3,
              customClipper: customClipper,
            )),
        CustomClipPath(
          listColor: listColor,
          begin: begin2,
          end: end2,
          coeffHeight: fifthHeightCoeff ??= 0.28,
          customClipper: customClipper,
        ),
        Positioned(
          top: topPosition ??= 50,
          child: Text(
            text ??= '',
            style: TextStyle(
              fontSize: fontSize ??= 70,
              fontFamily: customFont,
              fontWeight: fontWeight ??= FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

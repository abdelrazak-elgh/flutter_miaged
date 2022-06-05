import 'package:flutter/material.dart';
import 'package:mvp1/presentation/commons/colors.dart';
import 'package:mvp1/presentation/components/custom_clipper.dart';
import 'package:mvp1/presentation/components/custom_shape.dart';

final listGradientColor = listColorLavande;

final topLoginShape = CustomShape(
  listColor: listGradientColor,
  begin1: Alignment.bottomRight,
  end1: Alignment.topLeft,
  begin2: Alignment.bottomRight,
  end2: Alignment.topLeft,
  customFont: 'HelloParis',
  fontSize: 80,
  topPosition: 50,
  text: 'MiageD',
  customClipper: MyTopClipper(screenNumber: 1),
  firstHeightCoeff: 0.25,
  secondHeightCoeff: 0.245,
  thirdHeightCoeff: 0.235,
  fourthHeightCoeff: 0.22,
  fifthHeightCoeff: 0.2,
);

final bottomLoginShape = CustomShape(
  listColor: listGradientColor,
  begin1: Alignment.topLeft,
  end1: Alignment.bottomRight,
  begin2: Alignment.topLeft,
  end2: Alignment.bottomRight,
  customFont: 'HelloParis',
  fontSize: 100,
  customClipper: MyBottomClipper(screenNumber: 1),
  firstHeightCoeff: 0.14,
  secondHeightCoeff: 0.135,
  thirdHeightCoeff: 0.125,
  fourthHeightCoeff: 0.11,
  fifthHeightCoeff: 0.09,
  stackAlignment: Alignment.bottomCenter,
);

final topSignUpShape = CustomShape(
  listColor: listGradientColor,
  begin1: Alignment.topLeft,
  end1: Alignment.bottomRight,
  begin2: Alignment.topLeft,
  end2: Alignment.bottomRight,
  customFont: 'HelloParis',
  fontSize: 80,
  topPosition: 50,
  text: 'MiageD',
  customClipper: MyTopClipper(screenNumber: 2),
  firstHeightCoeff: 0.25,
  secondHeightCoeff: 0.245,
  thirdHeightCoeff: 0.235,
  fourthHeightCoeff: 0.22,
  fifthHeightCoeff: 0.2,
);

final bottomSignUpShape = CustomShape(
  listColor: listGradientColor,
  begin1: Alignment.bottomRight,
  end1: Alignment.topLeft,
  begin2: Alignment.bottomRight,
  end2: Alignment.topLeft,
  customFont: 'HelloParis',
  fontSize: 100,
  customClipper: MyBottomClipper(screenNumber: 2),
  firstHeightCoeff: 0.14,
  secondHeightCoeff: 0.135,
  thirdHeightCoeff: 0.125,
  fourthHeightCoeff: 0.11,
  fifthHeightCoeff: 0.09,
  stackAlignment: Alignment.bottomCenter,
);

import 'package:flutter/material.dart';

final List<Color> buttonColor1 = [
  Colors.deepPurple.shade300,
  Colors.deepPurple.shade200,
  Colors.deepPurple.shade100,
];

final List<Color> listColorSimpleBlue = [
  customColor('697FBD'),
  customColor('899BCD'),
  customColor('BDC7E2'),
  customColor('E8EAF6'),
];
final List<Color> listColorDarkBlue = [
  customColor('B4BBFA'),
  customColor('929CDE'),
  customColor('7A86CC'),
  customColor('6A75BA'),
];
final List<Color> listColorPaleSilver = [
  customColor('C3B8B4'),
  customColor('C7BFBC'),
  customColor('CECBC9'),
  customColor('D3D3D3'),
];
// 5 COULEURS
final List<Color> listColorPastelGold = [
  customColor('EEE8AB'),
  customColor('ECE1A2'),
  customColor('EAD998'),
  customColor('E8D28F'),
  customColor('E6CA85'),
];
final List<Color> listColorPaleGreen = [
  customColor('A3FBA3'),
  customColor('B9FBB9'),
  customColor('CFFBCF'),
  customColor('E4FAE4'),
  customColor('F6FAF3'),
];
final List<Color> listColorLightPLatinium = [
  customColor('ECECE9'),
  customColor('E5E4E1'),
  customColor('DFDEDC'),
  customColor('D9D9D7'),
  customColor('D3D3D2'),
];
final List<Color> listColorOrange = [
  customColor('FFAB7A'),
  customColor('FFB485'),
  customColor('FFC79C'),
  customColor('FFD0A7'),
  customColor('FFD9B2'),
];
final List<Color> listColorPalePurple = [
  customColor('F1EDF4'),
  customColor('E8D8ED'),
  customColor('E0C4E7'),
  customColor('D7AFE0'),
  customColor('CE9AD9'),
];
final List<Color> listColorWater = [
  customColor('E3FAFF'),
  customColor('C9E9F5'),
  customColor('BEE1F1'),
  customColor('B2D8EE'),
  customColor('A7D0EA'),
];
final List<Color> listColorSoft = [
  customColor('FDE9F5'),
  customColor('EFE2F4'),
  customColor('E1DAF4'),
  customColor('D2D3F3'),
  customColor('C4CBF2'),
];
final List<Color> listColorQuiet = [
  customColor('FDEDC8'),
  customColor('F0E6D2'),
  customColor('E3DEDC'),
  customColor('D6D7E5'),
  customColor('C9CFEF'),
];
final List<Color> listColorGalaxy = [
  customColor('C3C1E6'),
  customColor('D2C6E8'),
  customColor('E1CCEB'),
  customColor('F0D1ED'),
  customColor('FFD6EF'),
];
final List<Color> listColorWhite = [
  customColor('F2F3F5'),
  customColor('FFFFFF'),
  customColor('FCFCFC'),
  customColor('F5F6F7'),
  customColor('F9F9FB'),
];
final List<Color> listColorWhiteGradient = [
  customColor('E5E6E4'),
  customColor('ECECEB'),
  customColor('F2F3F2'),
  customColor('F9F9F8'),
  customColor('FFFFFF'),
];
// 6 COULEURS
final List<Color> listColorShinyWhite = [
  customColor('FCFCFF'),
  customColor('F8F8FF'),
  customColor('F4F4FB'),
  customColor('EFEFF6'),
  customColor('EBEBF2'),
  customColor('E6E6ED'),
];
final List<Color> listColorLightBlue = [
  customColor('87CEFA'),
  customColor('9BD7FB'),
  customColor('B0E0FC'),
  customColor('C1E9FC'),
  customColor('D9F2FE'),
  customColor('EDFBFF'),
];

final List<Color> listColorIcyBlue = [
  customColor('D4F1F8'),
  customColor('C0E2F0'),
  customColor('ACD3E8'),
  customColor('99C4E1'),
  customColor('85B5D9'),
  customColor('71A6D1'),
];

final List<Color> listColorLavande = [
  customColor('E6E6FA'),
  customColor('D6D1EC'),
  customColor('C6BBDF'),
  customColor('B6A6D1'),
  customColor('A690C4'),
  customColor('967BB6'),
];

final List<Color> listColorLightDarkGold = [
  customColor('B76E78'),
  customColor('C5858C'),
  customColor('D49DA1'),
  customColor('E2B4B5'),
  customColor('F1CCCA'),
  customColor('FFE3DE'),
];

Color customColor(String hex) {
  final String codeHex = '0xFF' + hex;
  return Color(int.parse(codeHex));
}

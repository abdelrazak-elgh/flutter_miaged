// ignore_for_file: empty_constructor_bodies

import 'package:flutter/cupertino.dart';

class MyTopClipper extends CustomClipper<Path> {
  final int screenNumber;
  MyTopClipper({required this.screenNumber});

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (screenNumber == 1) {
      path.lineTo(0, size.height * 0.5);
      path.cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
          size.height / 2, size.width, size.height * 0.9);
    }
    if (screenNumber == 2) {
      path.lineTo(0, size.height * 0.9);
      path.cubicTo(size.width / 4, size.height * 0.6, 3 * (size.width / 4),
          3 * (size.height / 2), size.width, size.height * 0.5);
    }

    // path.lineTo(0, size.height * 0.9);
    //   path.cubicTo(size.width / 4, size.height, 4 * (size.width / 4),
    //       size.height * 0.3, size.width * 0.7, 0);
    // path.moveTo(size.width * 0.7, 0);
    // path.cubicTo(size.width * 0.8, size.height, size.width * 0.9,
    //     -2 * (size.height / 4), size.width, size.height * 0.5);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyBottomClipper extends CustomClipper<Path> {
  final int screenNumber;
  MyBottomClipper({required this.screenNumber});
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    debugPrint(size.height.toString());
    Path path = Path();

    if (screenNumber == 1) {
      // path.moveTo(0, size.height);
      // path.lineTo(0, size.height * 0.5);
      // var firstStart = Offset(size.width * 0.1, size.height);
      // var firstEnd = Offset(size.width * 0.4, size.height * 0.85);
      // path.quadraticBezierTo(
      //     firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
      // var secondStart = Offset(size.width * 0.8, size.height * 0.6);
      // var secondEnd = Offset(size.width, size.height * 0.9);
      // path.quadraticBezierTo(
      //     secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
      // path.lineTo(size.width, size.height);
      path.moveTo(0, size.height);
      path.lineTo(0, 0);
      var firstStart = Offset(size.width * 0.1, size.height);
      var firstEnd = Offset(size.width * 0.4, size.height * 0.7);
      path.quadraticBezierTo(
          firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
      var secondStart = Offset(size.width * 0.8, size.height * 0.3);
      var secondEnd = Offset(size.width, size.height * 0.8);
      path.quadraticBezierTo(
          secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
      path.lineTo(size.width, size.height);
    }

    if (screenNumber == 2) {
      path.moveTo(0, size.height);
      path.lineTo(0, size.height * 0.9);
      var firstStart = Offset(size.width * 0.2, size.height * 0.6);
      var firstEnd = Offset(size.width * 0.6, size.height * 0.85);
      path.quadraticBezierTo(
          firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
      var secondStart = Offset(size.width * 0.9, size.height);
      var secondEnd = Offset(size.width, size.height * 0.5);
      path.quadraticBezierTo(
          secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
      path.lineTo(size.width, size.height);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

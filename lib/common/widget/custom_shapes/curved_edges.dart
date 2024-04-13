import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);


    final firstcurve = Offset(0, size.height - 20);
    final lastcurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstcurve.dx, firstcurve.dy, lastcurve.dx, lastcurve.dy);

    final secondFirstcurve = Offset(0, size.height - 20);
    final SecondLastcurve = Offset(size.width-30, size.height - 20);
    path.quadraticBezierTo(secondFirstcurve.dx, secondFirstcurve.dy, SecondLastcurve.dx, SecondLastcurve.dy);

    final thirdFirstcurve = Offset(size.width, size.height - 20);
    final thirdLastcurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdFirstcurve.dx, thirdFirstcurve.dy, thirdLastcurve.dx, thirdLastcurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
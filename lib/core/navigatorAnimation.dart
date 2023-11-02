import 'package:flutter/material.dart';

class SlidePageRoute {
  static Route create(Widget page, {Offset begin = const Offset(0.0, 1.0), Offset end = Offset.zero, Curve curve = Curves.ease}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
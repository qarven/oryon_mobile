import 'package:flutter/animation.dart';

abstract final class AppMotion {
  static const Duration instant = Duration.zero;
  static const Duration fast = Duration(milliseconds: 100);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 400);
  static const Duration deliberate = Duration(milliseconds: 500);

  static const Curve linear = Curves.linear;

  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve standard = Curves.easeInOut;

  static const Curve exit = Curves.easeInCubic;
  static const Curve enter = Curves.easeOutCubic;

  static const Curve bounceIn = Curves.bounceIn;
  static const Curve bounceOut = Curves.bounceOut;
  static const Curve bounceInOut = Curves.bounceInOut;

  static const Curve emphasized = Curves.easeInOutCubicEmphasized;
}

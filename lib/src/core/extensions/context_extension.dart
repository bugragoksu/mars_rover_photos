import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double dynamicHeight(double val) => height * val;
  double dynamicWidth(double val) => width * val;

  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicHeight(0.05);
  double get highValue => dynamicHeight(0.075);
}

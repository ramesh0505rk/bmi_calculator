import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class BmiCalculation {
  BmiCalculation({this.weight, this.height});
  final int? height;
  final int? weight;

  double? _bmi;
  Color? resColor;

  String calculateBmi() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String result() {
    if (_bmi! >= 25) {
      resColor = Colors.redAccent;
      return 'Overweight';
    } else if (_bmi! >= 18.5) {
      resColor = Colors.green;
      return 'Normal';
    } else {
      resColor = Colors.orangeAccent;
      return 'Underweight';
    }
  }

  String suggestions() {
    if (_bmi! >= 25) {
      return 'You have a higher body weight than normal. Try to workout more';
    } else if (_bmi! >= 18.5) {
      return 'Great job, you have a normal body weight';
    } else {
      return 'you have a lower body weight than normal. Try to eat more.';
    }
  }
}

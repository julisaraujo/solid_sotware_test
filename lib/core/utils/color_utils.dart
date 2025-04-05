import 'dart:math';
import 'package:flutter/material.dart';

/// Generates a random color.
Color getRandomColor() {
  final random = Random();
  const int maxValue = 255;
  
  return Color.fromRGBO(
    random.nextInt(maxValue),
    random.nextInt(maxValue),
    random.nextInt(maxValue),
    1.0,
  );
}

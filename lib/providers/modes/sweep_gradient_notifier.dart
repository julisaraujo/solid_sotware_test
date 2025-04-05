import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/core/utils/color_utils.dart';

/// A [StateNotifier] that manages a sweep gradient state.
final sweepGradientProvider =
    StateNotifierProvider<SweepGradientNotifier, SweepGradient>(
  (_) => SweepGradientNotifier(),
);

/// A [StateNotifier] that generates a random sweep gradient.
class SweepGradientNotifier extends StateNotifier<SweepGradient> {
  /// Creates a [SweepGradientNotifier] with an initial gradient.
  SweepGradientNotifier()
      : super(
          const SweepGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ) {
    createRandomSweepGradient();
  }

  /// Generates a random sweep gradient and updates the state.
  void createRandomSweepGradient() {
    final Color color1 = getRandomColor();
    Color color2;
    Color color3;
    Color color4;

    do {
      color2 = getRandomColor();
    } while (color2 == color1);

    do {
      color3 = getRandomColor();
    } while (color3 == color1 || color3 == color2);

    do {
      color4 = getRandomColor();
    } while (color4 == color1 || color4 == color2 || color4 == color3);

    final random = Random();
    final double startAngle = random.nextDouble() * 2 * pi;
    final double sweepAmount = (pi / 2) + random.nextDouble() * pi;
    final double endAngle = (startAngle + sweepAmount).clamp(0, 2 * pi);
    state = SweepGradient(
      colors: [color1, color2, color3, color4],
      startAngle: startAngle,
      endAngle: endAngle,
    );
  }
}

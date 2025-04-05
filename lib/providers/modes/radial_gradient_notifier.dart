import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/core/utils/color_utils.dart';

/// A provider that manages a radial gradient state.
final radialGradientProvider =
    StateNotifierProvider<RadialGradientNotifier, RadialGradient>(
  (_) => RadialGradientNotifier(),
);

/// A notifier that generates a random radial gradient.
class RadialGradientNotifier extends StateNotifier<RadialGradient> {
  /// Creates a [RadialGradientNotifier] with an initial gradient.
  RadialGradientNotifier()
      : super(
          const RadialGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ) {
    createRandomRadialGradient();
  }

  /// Generates a random radial gradient and updates the state.
  void createRandomRadialGradient() {
    final Color color1 = getRandomColor();
    Color color2;
    do {
      color2 = getRandomColor();
    } while (color2 == color1);

    final random = Random();
    final randomScale = 0.5 + random.nextDouble();

    state = RadialGradient(
      colors: [
        color1,
        color2,
      ],
      radius: randomScale,
    );
  }
}

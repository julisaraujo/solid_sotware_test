import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/core/utils/color_utils.dart';

/// A provider that manages a linear gradient state.
final linearGradientProvider =
    StateNotifierProvider<LinearGradientNotifier, LinearGradient>(
  (_) => LinearGradientNotifier(),
);

/// A notifier that generates a random linear gradient.
class LinearGradientNotifier extends StateNotifier<LinearGradient> {
  /// Creates a [LinearGradientNotifier] with an initial gradient.
  LinearGradientNotifier()
      : super(
          const LinearGradient(
            colors: [
              Color.fromRGBO(0, 0, 0, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
        ) {
    createRandomLinearGradient();
  }

  /// Generates a random linear gradient and updates the state.
  void createRandomLinearGradient() {
    final Color color1 = getRandomColor();
    Color color2;
    do {
      color2 = getRandomColor();
    } while (color2 == color1);

    final List<Alignment> alignments = [
      Alignment.topLeft,
      Alignment.topRight,
      Alignment.bottomLeft,
      Alignment.bottomRight,
    ];
    final random = Random();
    final Alignment begin = alignments[random.nextInt(alignments.length)];
    Alignment end;
    do {
      end = alignments[random.nextInt(alignments.length)];
    } while (begin == end);
    state = LinearGradient(
      colors: [
        color1,
        color2,
      ],
      begin: begin,
      end: end,
    );
  }
}

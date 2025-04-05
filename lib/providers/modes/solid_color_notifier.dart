import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/core/utils/color_utils.dart';

/// A [StateNotifier] that manages a solid color state.
final solidColorProvider = StateNotifierProvider<SolidColorNotifier, Color>(
  (_) => SolidColorNotifier(),
);

/// A [StateNotifier] that generates a random solid color.
class SolidColorNotifier extends StateNotifier<Color> {
  /// Creates a [SolidColorNotifier] with an initial color.
  SolidColorNotifier() : super(const Color.fromRGBO(0, 0, 0, 1)) {
    createRandomColor();
  }

  /// Generates a random color and updates the state.
  void createRandomColor() {
    state = getRandomColor();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/core/utils/enums/color_mode.dart';
import 'package:solid_sotware_test/providers/modes/linear_gradient_notifier.dart';
import 'package:solid_sotware_test/providers/modes/radial_gradient_notifier.dart';
import 'package:solid_sotware_test/providers/modes/solid_color_notifier.dart';
import 'package:solid_sotware_test/providers/modes/sweep_gradient_notifier.dart';

/// A provider that manages the current color mode.
final colorModeProvider =
    StateNotifierProvider<ColorModeNotifier, ColorMode>((ref) {
  return ColorModeNotifier(ref);
});

/// A [StateNotifier] that manages and updates the current [ColorMode].
class ColorModeNotifier extends StateNotifier<ColorMode> {

  /// A reference that provides access to other providers.
  final Ref ref;

  /// Get the current color mode
  ColorMode get mode => state;

  /// Set the color mode to the given mode
  set mode(ColorMode mode) => state = mode;

  /// Constructor
  /// [ref] is used to access other providers
  ColorModeNotifier(this.ref) : super(ColorMode.solid);

  /// Change the color based on the current mode
  void changeColor() {
    switch (state) {
      case ColorMode.solid:
        ref.read(solidColorProvider.notifier).createRandomColor();
      case ColorMode.linearGradient:
        ref.read(linearGradientProvider.notifier).createRandomLinearGradient();
      case ColorMode.radialGradient:
        ref.read(radialGradientProvider.notifier).createRandomRadialGradient();
      case ColorMode.sweepGradient:
        ref.read(sweepGradientProvider.notifier).createRandomSweepGradient();
    }
  }
}

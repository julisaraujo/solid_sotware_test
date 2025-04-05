import 'package:solid_sotware_test/core/utils/enums/color_mode.dart';

/// Extension methods for the [ColorMode] enum.
extension ColorModeExtension on ColorMode {
  /// Returns the corresponding name of the [ColorMode] enum value.
  String getName() {
    switch (this) {
      case ColorMode.solid:
        return 'Solid';
      case ColorMode.linearGradient:
        return 'Linear Gradient';
      case ColorMode.radialGradient:
        return 'Radial Gradient';
      case ColorMode.sweepGradient:
        return 'Sweep Gradient';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/providers/modes/radial_gradient_notifier.dart';

/// A screen that displays a radial gradient background.
class RadialGradientScreen extends ConsumerWidget {
  /// Creates a [RadialGradientScreen] widget.
  const RadialGradientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradient = ref.watch(radialGradientProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
    );
  }
}

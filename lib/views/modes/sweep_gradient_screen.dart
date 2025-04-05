import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/providers/modes/sweep_gradient_notifier.dart';

/// A screen that displays a sweep gradient background.
class SweepGradientScreen extends ConsumerWidget {
  /// Creates a new instance of the [SweepGradientScreen] widget.
  const SweepGradientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradient = ref.watch(sweepGradientProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
    );
  }
}

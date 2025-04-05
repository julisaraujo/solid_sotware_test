import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/providers/modes/linear_gradient_notifier.dart';

/// A screen that displays a linear gradient background.
class LinearGradientScreen extends ConsumerWidget {
  /// Creates a new instance of the [LinearGradientScreen] widget.
  const LinearGradientScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradient = ref.watch(linearGradientProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
    );
  }
}

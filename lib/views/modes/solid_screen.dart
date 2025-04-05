import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/providers/modes/solid_color_notifier.dart';

/// A screen that displays a solid color background.
class SolidScreen extends ConsumerWidget {
  /// Creates a new instance of the [SolidScreen] widget.
  const SolidScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(solidColorProvider);

    return Container(
      color: color,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:solid_sotware_test/core/utils/constants/font_family.dart';
import 'package:solid_sotware_test/core/utils/enums/color_mode.dart';
import 'package:solid_sotware_test/core/utils/extensions/color_mode_extension.dart';
import 'package:solid_sotware_test/providers/color_mode_notifier.dart';
import 'package:solid_sotware_test/views/modes/linear_gradient_screen.dart';
import 'package:solid_sotware_test/views/modes/radial_gradient_screen.dart';
import 'package:solid_sotware_test/views/modes/solid_screen.dart';
import 'package:solid_sotware_test/views/modes/sweep_gradient_screen.dart';

/// The HomeScreen widget is the main screen of the app
class HomeScreen extends ConsumerStatefulWidget {
/// Creates a new instance of the [HomeScreen] widget.
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final draggableController = DraggableScrollableController();
  bool isExpanded = false;

  static const double minSize = 0.075;
  static const double maxSize = 0.4;

  @override
  void initState() {
    super.initState();
    draggableController.addListener(() {
      setState(() {
        isExpanded = draggableController.size != minSize;
      });
    });
  }

  void _closeDraggableSheet() {
    draggableController.animateTo(
      minSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorMode = ref.watch(colorModeProvider);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _closeDraggableSheet();
          if (!isExpanded) {
            ref.read(colorModeProvider.notifier).changeColor();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            switch (colorMode) {
              ColorMode.solid => const SolidScreen(),
              ColorMode.linearGradient => const LinearGradientScreen(),
              ColorMode.radialGradient => const RadialGradientScreen(),
              ColorMode.sweepGradient => const SweepGradientScreen(),
            },
            const Text(
              "Hello there",
              style: TextStyle(
                fontFamily: FontFamily.poppins,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: DraggableScrollableSheet(
                controller: draggableController,
                snap: true,
                initialChildSize: minSize,
                minChildSize: minSize,
                maxChildSize: maxSize,
                builder: (_, scrollController) {
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(100),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          offset: Offset(0, -1),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      controller: scrollController,
                      itemCount: ColorMode.values.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.075,
                            child: Icon(
                              isExpanded
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_up,
                              color: Colors.white,
                              size: 40,
                            ),
                          );
                        }
                        final mode = ColorMode.values[index - 1];

                        return ListTile(
                          title: Center(
                            child: ShaderMask(
                              shaderCallback: (bounds) => LinearGradient(
                                colors: colorMode == mode
                                    ? [
                                        const Color.fromRGBO(255, 0, 0, 1),
                                        const Color.fromRGBO(0, 255, 0, 1),
                                        const Color.fromRGBO(0, 0, 255, 1),
                                      ]
                                    : [Colors.white, Colors.white],
                              ).createShader(bounds),
                              child: Text(
                                mode.getName(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: FontFamily.poppins,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            ref.read(colorModeProvider.notifier).mode = mode;
                            _closeDraggableSheet();
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

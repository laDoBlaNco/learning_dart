import 'package:flutter/material.dart';

import 'package:roll_dice_app/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});

  @override // extra metadata which isn't necessarily required, but it makes it clear
  // that we are making changes to the expected method 'build' as stated by the
  // superclass
  Widget build(context) {
    // remember that we are returning a Widget, so we  must have a 'return'
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors:  [
            // you can const a list literal in DART, interesting
            Color.fromARGB(255, 63, 6, 160),
            Color.fromARGB(255, 157, 6, 160),
          ],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const Center(
        child: StyledText(),
      ),
    );
  }
}

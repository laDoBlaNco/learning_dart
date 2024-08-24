import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hello Flutter!',
      style: TextStyle(fontSize: 28, color: Colors.white),
    );
  }
}
/**
 * Now that we know about variables we have the ability to make this widget
 * more 
 */
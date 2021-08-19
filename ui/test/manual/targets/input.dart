import 'package:flutter/material.dart';
import 'package:memento_ui/src/targets/input.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import '../preset.dart';

void main() {
  TestPreset(
    child: InputTest(),
  ).run();
}

class InputTest extends StatelessWidget {
  final FocusNode input1Node = FocusNode();

  @override
  Widget build(BuildContext context) => SimpleGestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => input1Node.unfocus(),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MementoInput(
              caption: 'Текст',
              focusNode: input1Node,
            ),
          ],
        ),
      );
}

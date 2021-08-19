import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/tabler_icons.dart';
import 'package:memento_ui/src/targets/circle_button.dart';
import 'package:memento_ui/src/targets/circle_toggle.dart';

import '../preset.dart';

void main() {
  TestPreset(child: CircleButtonTest()).run();
}

class CircleButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MementoCircleButton(
            icon: TablerIcons.check,
            onTap: () {},
          ),
          MementoCircleToggle(
            icon: TablerIcons.check,
            onColor: MementoColorTheme.of(context).strongOk,
            onGroundColor: MementoColorTheme.of(context).dimmedOk,
            onToggle: (toggle) => print(toggle),
          )
        ],
      );
}

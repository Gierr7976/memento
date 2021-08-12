import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/tabler_icons.dart';
import 'package:memento_ui/src/targets/button.dart';

import 'preset.dart';

void main() {
  TestPreset(child: ButtonTest()).run();
}

class ButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          MementoButton(
            icon: TablerIcons.chevron_left,
            alignment: ButtonAlignment.left,
            text: 'Кнопка',
            flat: false,
            onTap: () {},
          ),
          MementoButton(
            icon: TablerIcons.check,
            text: 'Кнопка',
            enabled: false,
            onTap: () {},
          ),
          MementoButton(
            icon: TablerIcons.chevron_right,
            alignment: ButtonAlignment.right,
            text: 'Кнопка',
            color: MementoColors.green1,
            backgroundColor: MementoColors.green4,
            onTap: () {},
          ),
        ],
      );
}

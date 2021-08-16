import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/tabler_icons.dart';
import 'package:memento_ui/src/targets/navigation/menu_button.dart';
import 'package:memento_ui/src/targets/navigation/navigation_button.dart';

import 'preset.dart';

void main() {
  TestPreset(child: NavigationButtonTest()).run();
}

class NavigationButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 156,
            child: MementoMenuButton(
              icon: TablerIcons.check,
              text: 'Кнопка',
              onTap: () {},
            ),
          ),
          Container(
            width: 156,
            child: MementoMenuButton(
              icon: TablerIcons.check,
              text: 'Кнопка',
              onTap: () {},
              enabled: false,
            ),
          ),
          MementoNavigationButton(
            title: 'Дальше',
            onTap: () {},
          ),
          MementoNavigationButton(
            title: 'Дальше',
            description:
                'Я опять сегодня прыгаю на кровати, потому что у меня всё в лимонаде',
            onTap: () {},
            groundColor: BrightTheme().dimmedOk,
            titleColor: BrightTheme().strongOk,
            descriptionColor: BrightTheme().ok,
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:memento_ui/src/navigation/tab_navigation/tab_navigation.dart';
import 'package:memento_ui/src/tabler_icons.dart';

import '../preset.dart';

void main() {
  TestPreset(child: TabNavigation()).run();
}

class TabNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MementoTabNavigation(
        tabs: [
          MementoTab(
            icon: TablerIcons.home,
            builder: (context) => Center(
              child: Icon(
                TablerIcons.home,
                size: 64,
              ),
            ),
          ),
          MementoTab(
            icon: TablerIcons.info_square,
            builder: (context) => Center(
              child: Icon(
                TablerIcons.info_square,
                size: 64,
              ),
            ),
          ),
          MementoTab(
            icon: TablerIcons.clock,
            builder: (context) => Center(
              child: Icon(
                TablerIcons.clock,
                size: 64,
              ),
            ),
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/data/collapsible/collapsible.dart';
import 'package:memento_ui/src/data/listing/listing.dart';

import '../preset.dart';

void main() {
  TestPreset(child: CollapsibleTest()).run();
}

class Data {
  final String header;
  final String body;

  Data({
    required this.header,
    required this.body,
  });
}

class CollapsibleTest extends StatelessWidget with MementoColorThemeUserMixin {
  const CollapsibleTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MementoListing<Data>(
        elements: [
          Data(
              header: 'Группа 1',
              body:
                  'Я опять сегодня прыгаю на кровати потому что у меня всё в лимонаде'),
          Data(
              header: 'Группа 2',
              body:
                  'Я опять сегодня прыгаю на кровати потому что у меня всё в лимонаде'),
        ],
        builder: (context, index, element) => MementoCollapsible(
          headerBuilder: (context) => Text(
            element.header,
            style: MementoText.mediumLabel
                .copyWith(color: colorTheme(context).semiDimmedText),
          ),
          bodyBuilder: (context) => Text(
            element.body,
            style: MementoText.small
                .copyWith(color: colorTheme(context).almostDimmedText),
            softWrap: true,
          ),
        ),
      );
}

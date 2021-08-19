import 'package:flutter/material.dart';
import 'package:memento_ui/src/data/list_element/list_element.dart';
import 'package:memento_ui/src/data/listing/selectable.dart';

import '../preset.dart';

void main() {
  TestPreset(child: ListElementTest()).run();
}

class Element {
  final String title;
  final String? description;

  Element({
    required this.title,
    this.description,
  });
}

class ListElementTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MementoSelectableListing<Element>(
        elements: [
          Element(
            title: 'Элемент 1',
            description:
                'Я опять сегодня прыгаю на кровати, потому что у меня всё в лимонаде',
          ),
          Element(
            title: 'Элемент 2',
          ),
          Element(
            title: 'Элемент 3',
            description:
                'Я опять сегодня прыгаю на кровати, потому что у меня всё в лимонаде',
          ),
        ],
        builder: (context, index, element, [selected = false]) =>
            MementoListElement(
          title: element.title,
          description: element.description,
          selected: selected,
          onTap: (){},
          onLongPress: () => MementoSelectableListing.of(context).toggle(index),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/data/listing/selectable.dart';
import 'package:memento_ui/src/data/user/card.dart';

import '../preset.dart';

void main() {
  TestPreset(child: UserCardTest()).run();
}

class User {
  final Color color;
  final String name;
  final String role;

  User({
    required this.color,
    required this.name,
    required this.role,
  });
}

class UserCardTest extends StatelessWidget {
  @override
  Widget build(BuildContext _) => MementoSelectableListing<User>(
        elements: [
          User(
            color: MementoColors.red1,
            name: 'Виктория',
            role: 'Директор лагеря',
          ),
          User(
              color: MementoColors.purple1,
              name: 'Анастасия',
              role: 'Старший вожатый'),
          User(
              color: MementoColors.teal1,
              name: 'Наталья',
              role: 'Старший воспитатель'),
        ],
        builder: (context, index, element, [selected = false]) =>
            MementoUserCard(
          userName: element.name,
          userRole: element.role,
          userColor: element.color,
          selected: selected,
          onLongPress: () => MementoSelectableListing.of(context).toggle(index),
        ),
      );
}

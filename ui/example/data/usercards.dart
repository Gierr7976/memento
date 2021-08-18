import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/data/listing/listing.dart';
import 'package:memento_ui/src/data/user/card.dart';

import '../preset.dart';

void main() {
  TestPreset(child: UserCardTest()).run();
}

class UserCardTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MementoListing<UserCardData>(
        elements: ListingElement.fromDataList([
          UserCardData(
            color: MementoColors.red1,
            name: 'Виктория',
            role: 'Директор лагеря',
          ),
          UserCardData(
              color: MementoColors.purple1,
              name: 'Анастасия',
              role: 'Старший вожатый'),
          UserCardData(
              color: MementoColors.teal1,
              name: 'Наталья',
              role: 'Старший воспитатель'),
        ]),
        builder: (context, element) => MementoUserCard(
          user: element.data,
          onTap: () {},
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/data/listing/listing.dart';
import 'package:memento_ui/src/data/topic/card.dart';

import '../preset.dart';

void main() {
  TestPreset(child: TopicCardTest()).run();
}

class Topic {
  final String title;
  final String authorName;
  final Color authorColor;
  final String authorRole;
  final int notificationCount;

  Topic({
    required this.title,
    required this.authorName,
    required this.authorColor,
    required this.authorRole,
    this.notificationCount = 0,
  });
}

class TopicCardTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MementoListing<Topic>(
        elements: [
          Topic(
            title: 'Что-то с чем-то',
            authorColor: MementoColors.red1,
            authorName: 'Виктория',
            authorRole: 'Директор лагеря',
            notificationCount: 0,
          ),
          Topic(
            title: 'Лимонад',
            authorColor: MementoColors.teal1,
            authorName: 'Наталья',
            authorRole: 'Старший воспитатель',
            notificationCount: 2,
          ),
          Topic(
            title: 'Всё в нём',
            authorColor: MementoColors.purple1,
            authorName: 'Анастасия',
            authorRole: 'Старший вожатый',
            notificationCount: 15,
          ),
          Topic(
            title: 'Что-то с чем-то',
            authorColor: MementoColors.red1,
            authorName: 'Виктория',
            authorRole: 'Директор лагеря',
            notificationCount: 256,
          ),
        ],
        builder: (context, index, e) => MementoTopicCard(
          title: e.title,
          authorName: e.authorName,
          authorRole: e.authorRole,
          authorColor: e.authorColor,
          notificationCount: e.notificationCount,
          onTap: () {},
        ),
      );
}

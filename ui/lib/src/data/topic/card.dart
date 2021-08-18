import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/data/avatar_card.dart';
import 'package:memento_ui/src/data/user/avatar.dart';

class MementoTopicCard extends StatelessWidget with MementoColorThemeUserMixin {
  final Color authorColor;
  final String authorName;
  final String authorRole;
  final String title;
  final int notificationCount;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  const MementoTopicCard({
    Key? key,
    this.onTap,
    this.onLongPress,
    required this.authorColor,
    required this.authorName,
    required this.authorRole,
    required this.title,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AvatarCard(
        avatar: AvatarData(
          label: authorName[0],
          color: authorColor,
        ),
        title: title,
        description: '$authorName, $authorRole',
        onTap: onTap,
        onLongPress: onLongPress,
        addons: [
          if (notificationCount > 0) _notificationLabel(context),
        ],
      );

  Container _notificationLabel(BuildContext context) => Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorTheme(context).primary,
        ),
        child: Center(
          child: Text(
            '${notificationCount > 9 ? '9+' : notificationCount}',
            style: MementoText.body14
                .copyWith(color: colorTheme(context).background),
          ),
        ),
      );
}

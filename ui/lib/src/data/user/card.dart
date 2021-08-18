import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/data/avatar_card.dart';
import 'package:memento_ui/src/data/user/avatar.dart';
import 'package:memento_ui/src/misc/constants.dart';
import 'package:memento_ui/src/tabler_icons.dart';

class MementoUserCard extends StatelessWidget with MementoColorThemeUserMixin {
  final Color userColor;
  final String userName;
  final String userRole;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final bool selected;

  const MementoUserCard({
    Key? key,
    this.onTap,
    this.selected = false,
    this.onLongPress,
    required this.userColor,
    required this.userName,
    required this.userRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AvatarCard(
        avatar: AvatarData(
          label: userName[0],
          color: userColor,
        ),
        title: userName,
        description: userRole,
        onTap: onTap,
        onLongPress: onLongPress,
        addons: [
          _selectionMarker(context),
        ],
      );

  AnimatedSwitcher _selectionMarker(BuildContext context) => AnimatedSwitcher(
        duration: FLASH_ANIMATION_DURATION,
        child: selected
            ? Icon(
                TablerIcons.circle_check,
                size: 24,
                color: colorTheme(context).ok,
              )
            : Container(
                width: 24,
                height: 24,
              ),
      );
}

import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/data/avatar_card.dart';
import 'package:memento_ui/src/data/user/avatar.dart';
import 'package:memento_ui/src/misc/constants.dart';
import 'package:memento_ui/src/tabler_icons.dart';

/// Карточка пользователя, визуализирующая аватар, имя и должность пользователя.
class MementoUserCard extends StatelessWidget with MementoColorThemeUserMixin {

  /// Цвет пользователя.
  final Color userColor;

  /// Имя пользователя, видимое для других.
  final String userName;

  /// Должность пользователя.
  final String userRole;

  /// То, что произойдёт, когда пользователь коснётся карточки.
  final GestureTapCallback? onTap;

  /// То, что произойдёт, когда пользователь зажмёт карточку. Как правило,
  /// используется в связке с [MementoSelectableListing] для выбора карточки:
  ///
  /// ```dart
  /// MementoSelectableListing(
  ///   builder: (context, index, element, [selected = false]) =>
  ///     MementoUserCard(
  ///       onLongPress: () => MementoSelectableListing.of(context).toggle(index),
  ///     ),
  /// );
  /// ```
  final GestureLongPressCallback? onLongPress;

  /// Выбрана ли карточка. Если [true], карточка помечается маркером.
  final bool selected;

  /// Базовый констркутор.
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

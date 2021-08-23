import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/data/avatar_card.dart';
import 'package:memento_ui/src/data/listing/listing.dart';
import 'package:memento_ui/src/data/user/avatar.dart';

/// Карточка темы, кратко представлающая её пользователю.
///
/// Как правило, используется в связке с [MementoListing].
class MementoTopicCard extends StatelessWidget with MementoColorThemeUserMixin {

  /// Цвет автора, подставляется в [MementoAvatar].
  final Color authorColor;

  /// Имя автора, видимое пользователям.
  final String authorName;

  /// Должность автора.
  final String authorRole;

  /// Заголовок темы.
  final String title;

  /// Число уведомлений, связанных с темой, полученных пользователем.
  /// Если больше девяти, отображается как "9+".
  final int notificationCount;

  /// То, что произойдёт, когда пользователь коснётся карточки.
  final GestureTapCallback? onTap;

  /// То, что произойдёт, когда пользователь зажмёт карточку.
  final GestureLongPressCallback? onLongPress;

  /// Базовый констркутор.
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

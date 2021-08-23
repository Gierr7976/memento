import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/data/user/avatar.dart';

/// Карточка с аватаром пользователя, заголовком и описанием.
class AvatarCard extends StatelessWidget with MementoColorThemeUserMixin {

  /// Данные аватара: цвет и метка пользователя. См. [AvatarData].
  final AvatarData avatar;

  /// Заголовок карточки.
  final String title;

  /// Описание карточки
  final String description;

  /// Дополнения карточки: маркеры, метки и т.п.
  final List<Widget> addons;

  /// То, что произойдёт, когда пользователь коснётся карточки.
  final GestureTapCallback? onTap;

  /// То, что произойдёт, когда пользователь зажмёт карточку.
  final GestureLongPressCallback? onLongPress;

  /// Базовый конструктор.
  AvatarCard({
    Key? key,
    required this.avatar,
    required this.title,
    required this.description,
    this.addons = const [],
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatClickable(
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
          child: Row(
            children: [
              MementoAvatar(
                avatar: avatar,
              ),
              _text(context),
              ...addons,
            ],
          ),
        ),
        onTap: onTap,
        onLongPress: onLongPress,
      );

  Expanded _text(BuildContext context) => Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
            constraints: BoxConstraints(minHeight: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(context),
                Container(
                  height: 18,
                ),
                _description(context),
              ],
            ),
          ),
        ),
      );

  Text _title(BuildContext context) => Text(
        title,
        style: MementoText.lead.copyWith(color: colorTheme(context).text),
        softWrap: true,
      );

  Text _description(BuildContext context) => Text(
        description,
        style: MementoText.small
            .copyWith(color: colorTheme(context).almostDimmedText, height: 0.5),
        softWrap: true,
      );
}

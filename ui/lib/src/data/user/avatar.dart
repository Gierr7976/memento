import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';

/// Данные аватара. Вероятно, что в будущем дополнится картинкой.
class AvatarData {
  /// Цвет пользователя.
  final Color color;

  /// Метка пользователя — первая буква имени.
  final String label;

  /// Базовый конструктор.
  AvatarData({
    required this.color,
    required this.label,
  }) : assert(label.length == 1);
}

/// Пользовательский аватар, представляющий собой первую букву имени
/// внутри круга цвета пользователя. Вероятно, что в будущем дополнится
/// картинкой.
class MementoAvatar extends StatelessWidget with MementoColorThemeUserMixin {
  /// Данные аватара.
  final AvatarData avatar;

  /// Базовый конструктор.
  MementoAvatar({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: avatar.color,
        ),
        child: Center(
          child: Text(
            avatar.label.toUpperCase(),
            style: MementoText.body16
                .copyWith(color: colorTheme(context).background),
          ),
        ),
      );
}

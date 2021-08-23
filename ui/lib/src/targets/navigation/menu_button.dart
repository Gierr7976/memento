import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';

/// Кнопка сетки-меню.
class MementoMenuButton extends StatelessWidget
    with MementoColorThemeUserMixin {
  /// Текстовая метка кнопки.
  final String text;

  /// Иконка кнопки.
  final IconData icon;

  /// Цвет текстовой метки и иконки.
  final Color? contentColor;

  /// Цвет подложки, по умолчанию — фоновый цвет темы.
  final Color? groundColor;

  /// Доступность кнопки для пользовательских взаимодейтвий.
  final bool enabled;

  /// То, что произойдёт, когда пользователь коснётся кнопки.
  final GestureTapCallback? onTap;

  /// Базовый конструктор.
  MementoMenuButton({
    Key? key,
    required this.text,
    required this.icon,
    this.enabled = true,
    this.contentColor,
    this.groundColor,
    this.onTap,
  }) : super(key: key);

  Color _getContentColor(BuildContext context) => enabled
      ? contentColor ?? colorTheme(context).semiDimmedText
      : colorTheme(context).dimmedText;

  @override
  Widget build(BuildContext context) => FlatClickable(
        constraints: BoxConstraints(minWidth: 156, minHeight: 100),
        color: groundColor,
        enabled: enabled,
        onTap: onTap,
        child: _content(context),
      );

  Widget _content(BuildContext context) => Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _icon(context),
            _caption(context),
          ],
        ),
      );

  Text _caption(BuildContext context) => Text(
        text,
        style: MementoText.small.copyWith(color: _getContentColor(context)),
      );

  Padding _icon(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: Icon(
          icon,
          size: 32,
          color: _getContentColor(context),
        ),
      );
}

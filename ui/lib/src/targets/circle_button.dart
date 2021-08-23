import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/misc/constants.dart';

/// Круглая кнопка с иконкой.
class MementoCircleButton extends StatelessWidget {
  /// Иконка кнопки.
  final IconData icon;

  /// Размер иконки:
  ///
  /// [true] — 24
  ///
  /// [false] — 32
  final bool small;

  /// Доступность кнопки для пользовательских взаимодействий.
  final bool enabled;

  /// Цвет иконки.
  final Color? color;

  /// Цвет подложки, по умолчанию — фоновый цвет темы.
  final Color? groundColor;

  /// То, что произойдёт, когда пользователь коснётся кнопки.
  final GestureTapCallback? onTap;

  /// Базовый конструктор.
  const MementoCircleButton({
    Key? key,
    required this.icon,
    this.small = true,
    this.enabled = true,
    this.color,
    this.groundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatClickable(
        child: Center(
          child: _icon(context),
        ),
        color: groundColor,
        onTap: onTap,
        enabled: enabled,
        shape: BoxShape.circle,
        constraints: BoxConstraints.tightFor(width: 48, height: 48),
      );

  AnimatedSwitcher _icon(BuildContext context) => AnimatedSwitcher(
        duration: SMALL_ANIMATION_DURATION,
        child: Icon(
          icon,
          key: ValueKey(icon.codePoint & _iconColor(context).value),
          size: _iconSize,
          color: _iconColor(context),
        ),
      );

  double get _iconSize => small ? 24 : 32;

  Color _iconColor(BuildContext context) => enabled
      ? color ?? MementoColorTheme.of(context).almostDimmedText
      : MementoColorTheme.of(context).dimmedText;
}

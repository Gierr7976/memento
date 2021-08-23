import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/toggleable.dart';
import 'package:memento_ui/src/targets/circle_button.dart';

/// Круглый переключатель с иконкой.
class MementoCircleToggle extends Toggleable {
  /// Иконка переключателя.
  final IconData icon;

  /// Размер иконки. См. [MementoCircleButton].
  final bool small;

  /// Доступность кнопки для пользовательских взаимодействий.
  final bool enabled;

  /// Цвет иконки, когда переключатель активирован.
  final Color? onColor;

  /// Цвет иконки, когда переключатель деактивирован.
  final Color? offColor;

  /// Цвет подложки, когда переключатель активирован.
  final Color? onGroundColor;

  /// Цвет подложки, когда переключатель деактивирован.
  final Color? offGroundColor;

  /// Базовый конструктор.
  MementoCircleToggle({
    Key? key,
    bool initialState = true,
    OnToggleCallback? onToggle,
    required this.icon,
    this.small = true,
    this.enabled = true,
    this.onColor,
    this.offColor,
    this.onGroundColor,
    this.offGroundColor,
  }) : super(
          key: key,
          initialState: initialState,
          onToggle: onToggle,
        );

  @override
  Widget builder(BuildContext context, bool state) => MementoCircleButton(
        icon: icon,
        color: _iconColor(context, state),
        groundColor: state ? onGroundColor : offGroundColor,
        enabled: enabled,
        small: small,
        onTap: () => toggle(context, state),
      );

  Color? _iconColor(BuildContext context, bool state) {
    return state ? onColor ?? MementoColorTheme.of(context).primary : offColor;
  }
}

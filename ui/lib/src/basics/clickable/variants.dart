import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/clickable.dart';
import 'package:memento_ui/src/misc/constants.dart';

/// [Clickable], имеющий тени для визуализации эффекта приподнятости.
///
/// <br>
/// Если эффект приподнятости не требуется, используйте [FlatClickable].
@immutable
class ElevatedClickable extends Clickable with MementoColorThemeUserMixin {
  /// Цвет [Ground], переопределяющий цвет по умолчанию (основной цвет темы).
  /// Передаётся, когда [ElevatedClickable] доступен для пользовательских
  /// взаимодействий.
  final Color? color;

  /// Базовый конструктор. Почти все его параметры передаются [Clickable].
  ElevatedClickable({
    Key? key,
    required Widget child,
    BoxShape shape = BoxShape.rectangle,
    this.color,
    BoxConstraints constraints = Clickable.DEFAULT_CONSTRAINTS,
    Duration duration = SMALL_ANIMATION_DURATION,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    bool enabled = true,
    BoxBorder? border,
    List<BoxShadow>? shadow,
  }) : super(
          key: key,
          constraints: constraints,
          duration: duration,
          shape: shape,
          child: child,
          onTap: onTap,
          onLongPress: onLongPress,
          enabled: enabled,
          border: border,
          shadow: shadow ?? MementoElevations.e2,
        );

  /// Определяет цвет, который будет передан [Ground].
  @override
  Color getColor(BuildContext context, [Color? color]) =>
      super.getColor(context, this.color ?? colorTheme(context).primary);
}

/// [Clickable] без визуализации эффекта приподнятости.
@immutable
class FlatClickable extends Clickable with MementoColorThemeUserMixin {
  /// Цвет [Ground], переопределяющий цвет по умолчанию (фоновый цвет темы).
  /// Передаётся, когда [FlatClickable] доступен для пользовательских
  /// взаимодействий.
  final Color? color;

  FlatClickable({
    Key? key,
    required Widget child,
    BoxConstraints constraints = Clickable.DEFAULT_CONSTRAINTS,
    BoxShape shape = BoxShape.rectangle,
    Duration duration = SMALL_ANIMATION_DURATION,
    this.color,
    GestureTapCallback? onTap,
    GestureLongPressCallback? onLongPress,
    bool enabled = true,
    BoxBorder? border,
  }) : super(
          key: key,
          constraints: constraints,
          shape: shape,
          duration: duration,
          child: child,
          onTap: onTap,
          onLongPress: onLongPress,
          enabled: enabled,
          border: border,
        );

  /// Определяет цвет, который будет передан [Ground].
  @override
  Color getColor(BuildContext context, [Color? color]) =>
      super.getColor(context, this.color ?? colorTheme(context).background);
}

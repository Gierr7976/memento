import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/clickable.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/targets/button/button.dart';

/// Кнопка с [FlatClickable], т.е без визуализации эффекта приподнятости.
class MementoFlatButton extends Button with MementoColorThemeUserMixin {
  /// Цвет содержимого кнопки, переопределяющий цвет по умолчанию (основной
  /// цвет темы). Передаётся, когда кнопка доступна для пользовательских
  /// взаимодействий.
  final Color? contentColor;

  /// Цвет подложки кнопки, переопределяющий цвет по умолчанию (фоновый цвет
  /// темы). Передаётся, когда кнопка доступна для пользовательских
  /// взаимодействий.
  final Color? groundColor;

  /// Базовый конструктор. Все параметры, кроме [contentColor] и [groundColor]
  /// передаются [Button].
  MementoFlatButton({
    Key? key,
    String? text,
    IconData? icon,
    this.contentColor,
    this.groundColor,
    BoxShape shape = BoxShape.rectangle,
    bool enabled = true,
    BoxConstraints? constraints,
    GestureTapCallback? onTap,
    BoxBorder? border,
    ButtonAlignment alignment = ButtonAlignment.center,
  }) : super(
          key: key,
          text: text,
          icon: icon,
          onTap: onTap,
          enabled: enabled,
          constraints: constraints,
          border: border,
          shape: shape,
          alignment: alignment,
        );

  /// Определяет цвет содержимого кнопки.
  @override
  Color getContentColor(BuildContext context, [Color? contentColor]) =>
      super.getContentColor(
        context,
        this.contentColor ?? colorTheme(context).primary,
      );

  /// Определяет цвет подложки кнопки.
  @override
  Color getGroundColor(BuildContext context, [Color? groundColor]) =>
      super.getGroundColor(
        context,
        this.groundColor ?? colorTheme(context).background,
      );

  @override
  Clickable clickable({required BuildContext context, required Widget child}) =>
      FlatClickable(
        child: child,
        shape: shape,
        border: border,
        enabled: enabled,
        onTap: onTap,
        constraints: constraints ?? Clickable.DEFAULT_CONSTRAINTS,
        color: getGroundColor(context),
      );
}

/// Кнопка c [ElevatedClickable], т.е с визуализацией эффекта возывышения.
///
/// <br>
/// Если эффект приподнятости не требуется, используйте [MementoFlatButton].
class MementoButton extends Button with MementoColorThemeUserMixin {
  /// Цвет содержимого кнопки, переопределяющий цвет по умолчанию (фоновый
  /// цвет темы). Передаётся, когда кнопка доступна для пользовательских
  /// взаимодействий.
  final Color? contentColor;

  /// Цвет подложки кнопки, переопределяющий цвет по умолчанию (основной цвет
  /// темы). Передаётся, когда кнопка доступна для пользовательских
  /// взаимодействий.
  final Color? groundColor;

  /// Базовый конструктор.
  MementoButton({
    Key? key,
    String? text,
    IconData? icon,
    this.contentColor,
    this.groundColor,
    BoxShape shape = BoxShape.rectangle,
    bool enabled = true,
    BoxConstraints? constraints,
    GestureTapCallback? onTap,
    BoxBorder? border,
    ButtonAlignment alignment = ButtonAlignment.center,
  }) : super(
          key: key,
          text: text,
          icon: icon,
          onTap: onTap,
          enabled: enabled,
          constraints: constraints,
          border: border,
          shape: shape,
          alignment: alignment,
        );

  /// Определяет цвет содержимого кнопки.
  @override
  Color getContentColor(BuildContext context, [Color? contentColor]) =>
      super.getContentColor(
        context,
        this.contentColor ?? colorTheme(context).background,
      );

  /// Определяет цвет подложки кнопки.
  @override
  Color getGroundColor(BuildContext context, [Color? groundColor]) =>
      super.getGroundColor(
        context,
        this.groundColor ?? colorTheme(context).primary,
      );

  @override
  Clickable clickable({required BuildContext context, required Widget child}) =>
      ElevatedClickable(
        child: child,
        shape: shape,
        border: border,
        enabled: enabled,
        onTap: onTap,
        constraints: constraints ?? Clickable.DEFAULT_CONSTRAINTS,
        color: getGroundColor(context),
      );
}

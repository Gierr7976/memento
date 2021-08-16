import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/clickable.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/targets/button/button.dart';

class MementoFlatButton extends Button with MementoColorThemeUserMixin {
  final Color? contentColor;

  MementoFlatButton({
    Key? key,
    String? text,
    IconData? icon,
    this.contentColor,
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

  @override
  Color getContentColor(BuildContext context, [Color? contentColor]) =>
      super.getContentColor(
        context,
        contentColor ?? colorTheme(context).primary,
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
      );
}

class MementoButton extends Button with MementoColorThemeUserMixin {
  final Color? contentColor;
  final Color? groundColor;

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

  @override
  Color getContentColor(BuildContext context, [Color? contentColor]) =>
      super.getContentColor(
        context,
        contentColor ?? colorTheme(context).background,
      );

  @override
  Color getGroundColor(BuildContext context, [Color? groundColor]) =>
      super.getGroundColor(
        context,
        groundColor ?? colorTheme(context).primary,
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

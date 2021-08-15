import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/clickable.dart';

@immutable
class ElevatedClickable extends Clickable with MementoColorThemeUserMixin {
  ElevatedClickable({
    Key? key,
    required Widget child,
    BoxShape shape = BoxShape.rectangle,
    Color? color,
    BoxConstraints constraints = Clickable.DEFAULT_CONSTRAINTS,
    GestureTapCallback? onTap,
    bool enabled = true,
    BoxBorder? border,
  }) : super(
          key: key,
          constraints: constraints,
          shape: shape,
          child: child,
          onTap: onTap,
          enabled: enabled,
          color: color,
          border: border,
          shadow: MementoElevations.e2,
        );

  @override
  Color getGroundColor(BuildContext context) => enabled
      ? color ?? colorTheme(context).primary
      : colorTheme(context).background;
}

@immutable
class FlatClickable extends Clickable with MementoColorThemeUserMixin {
  FlatClickable({
    Key? key,
    required Widget child,
    BoxConstraints constraints = Clickable.DEFAULT_CONSTRAINTS,
    BoxShape shape = BoxShape.rectangle,
    GestureTapCallback? onTap,
    bool enabled = true,
    BoxBorder? border,
  }) : super(
          key: key,
          constraints: constraints,
          shape: shape,
          child: child,
          onTap: onTap,
          enabled: enabled,
          border: border,
        );

  @override
  Color getGroundColor(BuildContext context) => colorTheme(context).background;
}

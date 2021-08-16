import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/clickable.dart';
import 'package:memento_ui/src/misc/constants.dart';

@immutable
class ElevatedClickable extends Clickable with MementoColorThemeUserMixin {
  final Color? color;

  ElevatedClickable({
    Key? key,
    required Widget child,
    BoxShape shape = BoxShape.rectangle,
    this.color,
    BoxConstraints constraints = Clickable.DEFAULT_CONSTRAINTS,
    Duration duration = SMALL_ANIMATION_DURATION,
    GestureTapCallback? onTap,
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
          enabled: enabled,
          border: border,
          shadow: shadow ?? MementoElevations.e2,
        );

  @override
  Color getColor(BuildContext context, [Color? color]) =>
      super.getColor(context, this.color ?? colorTheme(context).primary);
}

@immutable
class FlatClickable extends Clickable with MementoColorThemeUserMixin {
  final Color? color;

  FlatClickable({
    Key? key,
    required Widget child,
    BoxConstraints constraints = Clickable.DEFAULT_CONSTRAINTS,
    BoxShape shape = BoxShape.rectangle,
    Duration duration = SMALL_ANIMATION_DURATION,
    this.color,
    GestureTapCallback? onTap,
    bool enabled = true,
    BoxBorder? border,
  }) : super(
          key: key,
          constraints: constraints,
          shape: shape,
          duration: duration,
          child: child,
          onTap: onTap,
          enabled: enabled,
          border: border,
        );

  @override
  Color getColor(BuildContext context, [Color? color]) =>
      super.getColor(context, this.color ?? colorTheme(context).background);
}

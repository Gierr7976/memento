import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/ground/ground.dart';
import 'package:memento_ui/src/misc/constants.dart';

@immutable
abstract class Clickable extends StatelessWidget
    with MementoColorThemeUserMixin {
  static const DEFAULT_CONSTRAINTS =
      BoxConstraints(minWidth: 48, minHeight: 48);

  final Widget child;
  final BoxConstraints constraints;
  final GestureTapCallback? onTap;
  final bool enabled;
  final BoxBorder? border;
  final BoxShape shape;
  final List<BoxShadow>? shadow;
  final Duration duration;

  Clickable({
    Key? key,
    required this.child,
    required this.constraints,
    this.duration = SMALL_ANIMATION_DURATION,
    this.shape = BoxShape.rectangle,
    this.onTap,
    this.enabled = true,
    this.border,
    this.shadow,
  }) : super(key: key);

  @mustCallSuper
  Color getColor(BuildContext context, [Color? color]) =>
      enabled ? color! : colorTheme(context).background;

  @override
  Widget build(BuildContext context) => _ground(
        context: context,
        child: _clipper(
          _touch(
            context: context,
            child: child,
          ),
        ),
      );

  Ground _ground({required BuildContext context, required Widget child}) =>
      Ground(
        duration: duration,
        shape: shape,
        color: getColor(context),
        constraints: constraints,
        child: child,
        border: border,
        borderRadius:
            shape == BoxShape.rectangle ? GENERIC_BORDER_RADIUS : null,
        shadow: shadow,
      );

  Widget _touch({required BuildContext context, required Widget child}) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          child: child,
          onTap: enabled ? onTap : null,
          splashColor: Colors.black12,
        ),
      );

  Widget _clipper(Widget child) {
    switch (shape) {
      case BoxShape.rectangle:
        return _roundedRectangleClipper(child);
      case BoxShape.circle:
        return _circleClipper(child);
    }
  }

  Widget _roundedRectangleClipper(Widget child) => ClipRRect(
        borderRadius: GENERIC_BORDER_RADIUS,
        child: child,
      );

  Widget _circleClipper(Widget child) => ClipOval(
        child: child,
      );
}

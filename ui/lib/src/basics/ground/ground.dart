import 'package:flutter/material.dart';
import 'package:memento_ui/src/misc/constants.dart';

@immutable
class Ground extends StatelessWidget {
  final BoxShape shape;
  final Color color;
  final BoxConstraints constraints;
  final List<BoxShadow>? shadow;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final Widget child;
  final Duration duration;

  Ground({
    Key? key,
    required this.shape,
    required this.color,
    required this.constraints,
    this.duration = SMALL_ANIMATION_DURATION,
    this.shadow,
    this.borderRadius,
    this.border,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: duration,
        constraints: constraints,
        decoration: BoxDecoration(
            color: color,
            shape: shape,
            borderRadius: borderRadius,
            border: border,
            boxShadow: shadow),
        child: child,
      );
}

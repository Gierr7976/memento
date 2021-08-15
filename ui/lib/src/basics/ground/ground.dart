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

  Ground({
    Key? key,
    required this.shape,
    required this.color,
    required this.constraints,
    this.shadow,
    this.borderRadius,
    this.border,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: SMALL_ANIMATION_DURATION,
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

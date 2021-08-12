import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/misc/constants.dart';

@immutable
class Clickable extends StatelessWidget {
  final Widget child;
  final bool flat;
  final Color? color;
  final BoxConstraints? constraints;
  final GestureTapCallback? onTap;
  final bool enabled;

  const Clickable({
    Key? key,
    required this.child,
    this.flat = true,
    this.color,
    this.constraints,
    this.onTap,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: SMALL_ANIMATION_DURATION,
      constraints: constraints ?? BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        color: enabled
            ? color ??
                (flat
                    ? MementoColorTheme.of(context).background
                    : MementoColorTheme.of(context).primary)
            : MementoColorTheme.of(context).background,
        borderRadius: GENERIC_BORDER_RADIUS,
        boxShadow: flat || !enabled ? null : MementoElevations.e2,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: GENERIC_BORDER_RADIUS,
          child: child,
          onTap: enabled ? onTap : null,
        ),
      ),
    );
  }
}

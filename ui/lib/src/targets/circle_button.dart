import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/misc/constants.dart';

class MementoCircleButton extends StatelessWidget {
  final IconData icon;
  final bool small;
  final bool enabled;
  final Color? color;
  final GestureTapCallback? onTap;

  const MementoCircleButton({
    Key? key,
    required this.icon,
    this.small = true,
    this.enabled = true,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatClickable(
    child: Center(
      child: _icon(context),
    ),
    onTap: onTap,
    enabled: enabled,
    shape: BoxShape.circle,
    constraints: BoxConstraints.tightFor(width: 48, height: 48),
  );

  AnimatedSwitcher _icon(BuildContext context) => AnimatedSwitcher(
        duration: SMALL_ANIMATION_DURATION,
        child: Icon(
          icon,
          key: ValueKey(icon.codePoint & _iconColor(context).value),
          size: _iconSize,
          color: _iconColor(context),
        ),
      );

  double get _iconSize => small ? 24 : 32;

  Color _iconColor(BuildContext context) => enabled
      ? color ?? MementoColorTheme.of(context).almostDimmedText
      : MementoColorTheme.of(context).dimmedText;
}

import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/misc/constants.dart';

class MementoCircleButton extends StatelessWidget {
  final IconData icon;
  final bool small;
  final bool enabled;
  final Color? color;
  final Color? backgroundColor;
  final GestureTapCallback? onTap;

  const MementoCircleButton({
    Key? key,
    required this.icon,
    this.small = true,
    this.enabled = true,
    this.color,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => _ground(context);

  AnimatedContainer _ground(BuildContext context) => AnimatedContainer(
        duration: SMALL_ANIMATION_DURATION,
        width: 48,
        height: 48,
        decoration: _groundDecoration(context),
        child: _touch(context),
      );

  Material _touch(BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: _icon(context),
          ),
          onTap: enabled ? onTap : null,
        ),
      );

  AnimatedSwitcher _icon(BuildContext context) => AnimatedSwitcher(
        duration: SMALL_ANIMATION_DURATION,
        child: Icon(
          icon,
          key: UniqueKey(),
          size: _iconSize,
          color: _iconColor(context),
        ),
      );

  double get _iconSize => small ? 24 : 32;

  Color _iconColor(BuildContext context) => enabled
      ? color ?? MementoColorTheme.of(context).almostDimmedText
      : MementoColorTheme.of(context).dimmedText;

  BoxDecoration _groundDecoration(BuildContext context) => BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor ?? MementoColorTheme.of(context).background,
      );
}
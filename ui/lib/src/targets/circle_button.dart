import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';

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
  Widget build(BuildContext context) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? MementoColorTheme.of(context).background,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(24),
            child: Center(
                child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: Icon(
                icon,
                key: UniqueKey(),
                size: small ? 24 : 32,
                color: enabled
                    ? color ?? MementoColorTheme.of(context).almostDimmedText
                    : MementoColorTheme.of(context).dimmedText,
              ),
            )),
            onTap: enabled ? onTap : null,
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/toggleable.dart';
import 'package:memento_ui/src/targets/circle_button.dart';

class MementoCircleToggle extends Toggleable {
  final IconData icon;
  final bool small;
  final bool enabled;
  final Color? onColor;
  final Color? offColor;
  final Color? onGroundColor;
  final Color? offGroundColor;

  MementoCircleToggle({
    Key? key,
    bool initialState = true,
    OnToggleCallback? onToggle,
    required this.icon,
    this.small = true,
    this.enabled = true,
    this.onColor,
    this.offColor,
    this.onGroundColor,
    this.offGroundColor,
  }) : super(
          key: key,
          initialState: initialState,
          onToggle: onToggle,
        );

  @override
  Widget builder(BuildContext context, bool state) => MementoCircleButton(
        icon: icon,
        color: _iconColor(context, state),
        groundColor: state ? onGroundColor : offGroundColor,
        enabled: enabled,
        small: small,
        onTap: () => toggle(context, state),
      );

  Color? _iconColor(BuildContext context, bool state) {
    return state ? onColor ?? MementoColorTheme.of(context).primary : offColor;
  }
}

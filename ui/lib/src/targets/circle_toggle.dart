import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/logic/toggle.dart';
import 'package:memento_ui/src/misc/toggleable.dart';
import 'package:memento_ui/src/targets/circle_button.dart';

class MementoCircleToggle extends Toggleable {
  final IconData icon;
  final bool small;
  final bool enabled;
  final Color? onColor;
  final Color? onBackgroundColor;
  final Color? offColor;
  final Color? offBackgroundColor;

  MementoCircleToggle({
    Key? key,
    bool initialState = true,
    OnToggleCallback? onToggle,
    required this.icon,
    this.small = true,
    this.enabled = true,
    this.onColor,
    this.onBackgroundColor,
    this.offColor,
    this.offBackgroundColor,
  }) : super(
          key: key,
          initialState: initialState,
          onToggle: onToggle,
        );

  @override
  Widget builder(BuildContext context, bool state) => _button(state, context);

  MementoCircleButton _button(bool state, BuildContext context) {
    return MementoCircleButton(
      icon: icon,
      color: _iconColor(state, context),
      backgroundColor: _backgroundColor(state),
      enabled: enabled,
      small: small,
      onTap: () => tap(state, context),
    );
  }

  Color? _backgroundColor(bool state) =>
      state ? onBackgroundColor : offBackgroundColor;

  Color? _iconColor(bool state, BuildContext context) {
    return state ? onColor ?? MementoColorTheme.of(context).primary : offColor;
  }
}

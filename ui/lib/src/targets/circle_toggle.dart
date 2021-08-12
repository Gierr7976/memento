library memento_ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/logic/toggle.dart';
import 'package:memento_ui/src/targets/circle_button.dart';

class MementoCircleToggle extends StatelessWidget {
  final bool initialState;
  final IconData icon;
  final bool small;
  final bool enabled;
  final Color? onColor;
  final Color? onBackgroundColor;
  final Color? offColor;
  final Color? offBackgroundColor;
  final void Function(bool)? onToggle;

  const MementoCircleToggle({
    Key? key,
    this.initialState = true,
    required this.icon,
    this.small = true,
    this.enabled = true,
    this.onColor,
    this.onBackgroundColor,
    this.offColor,
    this.offBackgroundColor,
    this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) => BlocProvider<ToggleCubit>(
        create: (__) => ToggleCubit(initialState),
        child: BlocBuilder<ToggleCubit, bool>(
          builder: (context, state) => MementoCircleButton(
            icon: icon,
            color: state
                ? onColor ?? MementoColorTheme.of(context).primary
                : offColor,
            backgroundColor: state ? onBackgroundColor : offBackgroundColor,
            enabled: enabled,
            small: small,
            onTap: () {
              onToggle?.call(!state);
              context.read<ToggleCubit>().toggle();
            },
          ),
        ),
      );
}

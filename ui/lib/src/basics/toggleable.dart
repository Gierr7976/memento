import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_ui/src/logic/toggle.dart';

typedef OnToggleCallback = void Function(bool);

abstract class Toggleable extends StatelessWidget {
  final OnToggleCallback? onToggle;
  final bool initialState;

  Toggleable({Key? key, this.onToggle, this.initialState = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ToggleCubit(initialState),
        child: BlocBuilder<ToggleCubit, bool>(
          builder: builder,
        ),
      );

  Widget builder(BuildContext context, bool state);

  void tap(BuildContext context, bool state) {
    onToggle?.call(!state);
    context.read<ToggleCubit>().toggle();
  }
}

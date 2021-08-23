import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_ui/src/logic/toggle.dart';

/// Тип функции-обработчика события переключения. Параметр отражает состояние
/// после переключения.
typedef OnToggleCallback = void Function(bool);

/// Абстракция, реализующая поведение переключаемых виджетов (т.е имеющих
/// состояния типа "включён/выключен".
abstract class Toggleable extends StatelessWidget {

  /// То, что произойдёт при переключении.
  final OnToggleCallback? onToggle;

  /// Начальное состояние.
  final bool initialState;

  /// Базовый конструктор.
  Toggleable({Key? key, this.onToggle, this.initialState = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ToggleCubit(initialState),
        child: BlocBuilder<ToggleCubit, bool>(
          builder: builder,
        ),
      );

  /// Описывает часть UI, представляемую наследником. Вызывается при изменении
  /// состояния [Toggleable].
  Widget builder(BuildContext context, bool state);

  /// Метод, который должны вызывать наследники для переключения [Toggleable].
  ///
  /// [state] должен отражать текущее состояние [Toggleable].
  void toggle(BuildContext context, bool state) {
    onToggle?.call(!state);
    context.read<ToggleCubit>().toggle();
  }
}

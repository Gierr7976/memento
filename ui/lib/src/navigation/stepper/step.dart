import 'package:flutter/widgets.dart';
import 'package:memento_ui/src/navigation/stepper/stepper.dart';

/// Тип функции-построителя виджета, визуализирующего шаг.
typedef StepBuilder = Widget Function(BuildContext context);

/// Тип функции-валидатора шага. Должен возвращать [true], если при выполнении шага
/// пользователь не допустил ошибок.
typedef StepValidator = bool Function();

/// Шаг [MementoStepper].
class MementoStep {
  /// Построитель виджета, визуализирующего шаг.
  final StepBuilder builder;

  /// Валидатор шага. Должен возвращать [true], если при выполнении шага
  /// пользователь не допустил ошибок.
  final StepValidator validator;

  /// Базовый конструктор. Если [validator] не задан, подставляет "нулевой"
  /// валидатор, постоянно возвращающий [true].
  factory MementoStep(
          {required StepBuilder builder, StepValidator? validator}) =>
      MementoStep._internal(
        builder: builder,
        validator: validator ?? () => true,
      );

  /// Внутренний конструктор.
  MementoStep._internal({required this.builder, required this.validator});
}

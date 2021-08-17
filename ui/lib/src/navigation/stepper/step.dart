import 'package:flutter/widgets.dart';

typedef StepBuilder = Widget Function(BuildContext context);
typedef StepValidator = bool Function();

class MementoStep {
  final StepBuilder builder;
  final StepValidator validator;

  factory MementoStep(
          {required StepBuilder builder, StepValidator? validator}) =>
      MementoStep._internal(
        builder: builder,
        validator: validator ?? () => true,
      );

  MementoStep._internal({required this.builder, required this.validator});
}

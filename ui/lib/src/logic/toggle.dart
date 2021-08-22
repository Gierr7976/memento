import 'package:flutter_bloc/flutter_bloc.dart';

/// [Cubit], ответственный за работу с состояниями вида "включён/выключен".
class ToggleCubit extends Cubit<bool> {
  /// Базовый конструктор.
  ToggleCubit(bool initialState) : super(initialState);

  /// Переключает состояние
  void toggle() => emit(!state);
}

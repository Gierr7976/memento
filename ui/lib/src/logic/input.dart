import 'package:flutter_bloc/flutter_bloc.dart';

/// Состояние ввода.
///
/// Обратите внимание, что ввод не может одновременно иметь фокус и состояние
/// валидации (проверяется соответствующим [assert]).
class InputState {
  /// Имеет ли ввод фокус. Если [true], [error] и [valid] должны быть
  /// равны [false].
  final bool focused;

  /// Некорректность данных ввода.
  final bool error;

  /// Корректность данных ввода.
  final bool valid;

  /// Данные ввода.
  final String data;

  /// Базовый конструктор.
  InputState({
    this.focused = false,
    this.error = false,
    this.valid = false,
    this.data = '',
  }) : assert(focused && !error && !valid || !focused);

  /// Копирует состояние с изменением некоторых параметров. Если параметр
  /// не равен [null], он будет подставлен в новое состояние.
  InputState copyWith({
    String? data,
    bool? focused,
    bool? error,
    bool? valid,
  }) =>
      InputState(
        data: data ?? this.data,
        focused: focused ?? this.focused,
        error: error ?? this.error,
        valid: valid ?? this.valid,
      );

  @override
  String toString() => '''
    InputState{
      data: $data,
      focused: $focused,
      valid: $valid,
      error: $error,
    }
  ''';
}

/// [Cubit], отвественный за работу с состоянием ввода.
class InputCubit extends Cubit<InputState> {
  /// Валидатор ввода. Используется для проверки корректности ввода после
  /// потери полем фокуса.
  final bool Function(String) validator;

  /// Базовый конструктор.
  InputCubit({
    String? initialData,
    required this.validator,
  }) : super(InputState());

  /// Фиксирует новым состоянием получение полем ввода фокуса.
  void focus() =>
      emit(state.copyWith(focused: true, valid: false, error: false));

  /// Фиксирует новым состоянием потерю полем ввода фокуса.
  void unfocus() {
    bool isValid = validator(state.data);
    emit(state.copyWith(focused: false, valid: isValid, error: !isValid));
  }

  /// Фиксирует новым состоянием изменение данных в поле ввода.
  void update(String newData) => emit(state.copyWith(data: newData));

  /// Сбрасывает состояние до состояния по умолчанию.
  void clear() => emit(InputState());
}

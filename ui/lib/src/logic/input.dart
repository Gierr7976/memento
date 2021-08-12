import 'package:flutter_bloc/flutter_bloc.dart';

class InputState {
  final bool focused;
  final bool error;
  final bool valid;
  final String data;

  InputState({
    this.focused = false,
    this.error = false,
    this.valid = false,
    this.data = '',
  });

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

class InputCubit extends Cubit<InputState> {
  final bool Function(String) validator;

  InputCubit({
    String? initialData,
    required this.validator,
  }) : super(InputState());

  void focus() =>
      emit(state.copyWith(focused: true, valid: false, error: false));

  void unfocus() {
    bool isValid = validator(state.data);
    emit(state.copyWith(focused: false, valid: isValid, error: !isValid));
  }

  void update(String newData) => emit(state.copyWith(data: newData));

  void clear() => emit(InputState());
}

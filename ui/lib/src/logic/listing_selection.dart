import 'package:flutter_bloc/flutter_bloc.dart';

/// [Cubit], ответственный за работу с состоянием выбора элементов.
///
/// <br>
/// Основан на [List<bool>], в котором каждый элемент соответствует состоянию
/// выбран/не выбран для выбираемых элементов.
class ListingSelectionCubit extends Cubit<List<bool>> {
  /// Конструктор "нулевого" состояния — задаёт в качестве начального состояния
  /// список, содержащий false для всех элементов.
  factory ListingSelectionCubit.zero(int elementCount) =>
      ListingSelectionCubit._internal(List.filled(elementCount, false));

  /// Базовый конструктор. Только для внутреннего пользования.
  ListingSelectionCubit._internal(List<bool> initialState)
      : super(initialState);

  /// Переключает состояние элемента с индексом [index].
  void toggle(int index) {
    assert(index >= 0 && index < state.length);

    emit([
      ...state.sublist(0, index),
      !state[index],
      ...state.sublist(index + 1),
    ]);
  }
}

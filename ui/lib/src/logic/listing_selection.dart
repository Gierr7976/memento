import 'package:flutter_bloc/flutter_bloc.dart';

class ListingSelectionCubit extends Cubit<List<bool>> {
  factory ListingSelectionCubit.zero(int elementCount) =>
      ListingSelectionCubit._internal(List.filled(elementCount, false));

  ListingSelectionCubit._internal(List<bool> initialState)
      : super(initialState);

  void toggle(int index) {
    assert(index >= 0 && index < state.length);

    emit([
      ...state.sublist(0, index),
      !state[index],
      ...state.sublist(index + 1),
    ]);
  }
}

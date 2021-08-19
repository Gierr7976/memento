import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleCubit extends Cubit<bool> {
  ToggleCubit(bool initialState) : super(initialState);

  void toggle() => emit(!state);
}

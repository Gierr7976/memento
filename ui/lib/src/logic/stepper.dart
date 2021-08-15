import 'package:flutter_bloc/flutter_bloc.dart';

enum StepperDirection { prev, next }

class StepperState {
  final int step;
  final int? prevStep;

  StepperDirection get direction => prevStep != null
      ? step > prevStep!
          ? StepperDirection.next
          : StepperDirection.prev
      : StepperDirection.next;

  StepperState({
    this.step = 0,
    this.prevStep,
  });
}

class StepperCubit extends Cubit<StepperState> {
  final int maxStep;

  StepperCubit({required this.maxStep}) : super(StepperState());

  void scrollNext() {
    if (state.step < maxStep)
      emit(
        StepperState(
          step: state.step + 1,
          prevStep: state.step,
        ),
      );
  }

  void scrollPrev() {
    if (state.step > 0)
      emit(
        StepperState(
          step: state.step - 1,
          prevStep: state.step,
        ),
      );
  }

  void jump(int step) {
    if (step != state.step && step >= 0 && step <= maxStep)
      emit(
        StepperState(
          step: step,
          prevStep: state.step,
        ),
      );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

enum StepperDirection { up, down }

class StepperState {
  final StepperDirection direction;
  final int step;
  final int? prevStep;

  StepperState({
    this.direction = StepperDirection.down,
    this.step = 0,
    this.prevStep,
  });
}

class StepperCubit extends Cubit<StepperState> {

  final int maxStep;

  StepperCubit({required this.maxStep}) : super(StepperState());

  void scrollDown(){
    if(state.step < maxStep)
      emit(
        StepperState(
          step: state.step + 1,
          prevStep: state.step,
        ),
      );
  }

  void scrollUp(){
    if(state.step > 0)
      emit(
        StepperState(
          direction: StepperDirection.up,
          step: state.step - 1,
          prevStep: state.step,
        ),
      );
  }

  void jump(int step) {
    if (step != state.step && step >=0 && step <= maxStep)
      emit(
        StepperState(
          direction:
              step < state.step ? StepperDirection.up : StepperDirection.down,
          step: step,
          prevStep: state.step,
        ),
      );
  }
}

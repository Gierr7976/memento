import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_ui/src/layout/stepper/label.dart';
import 'package:memento_ui/src/layout/stepper/slider.dart';
import 'package:memento_ui/src/layout/stepper/step.dart';
import 'package:memento_ui/src/logic/stepper.dart';
import 'package:memento_ui/src/misc/constants.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class MementoStepper extends StatelessWidget {
  final List<MementoStep> steps;

  const MementoStepper({Key? key, required this.steps}) : super(key: key);

  static StepperCubit of(BuildContext context) => context.read();

  @override
  Widget build(BuildContext _) => Container(
        constraints: BoxConstraints(minHeight: _minHeight),
        child: BlocProvider(
          create: (_) => StepperCubit(maxStep: steps.length - 1),
          child: Builder(
            builder: (context) => SimpleGestureDetector(
              behavior: HitTestBehavior.translucent,
              child: Stack(
                children: [
                  _body(),
                  _labels(),
                ],
              ),
              onVerticalSwipe: (direction) => direction == SwipeDirection.down
                  ? MementoStepper.of(context).scrollUp()
                  : MementoStepper.of(context).scrollDown(),
            ),
          ),
        ),
      );

  double get _minHeight => 16.0 + 32 * steps.length + 200;

  BlocBuilder _labels() => BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) => LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              for (int index = 0; index < steps.length; index++)
                _label(
                  context: context,
                  state: state,
                  index: index,
                  height: constraints.maxHeight,
                )
            ],
          ),
        ),
      );

  BlocBuilder _body() => BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) => StepperSlider(
          key: ValueKey(state.step),
          slidingIn: steps[state.step].builder(context),
          slidingOut: state.prevStep != null
              ? steps[state.prevStep!].builder(context)
              : null,
          direction: state.direction,
        ),
      );

  AnimatedPositioned _label({
    required BuildContext context,
    required StepperState state,
    required int index,
    required double height,
  }) =>
      AnimatedPositioned(
        key: ValueKey(index),
        curve: Curves.easeInOut,
        width: 24,
        height: 24,
        duration: LONG_ANIMATION_DURATION,
        left: 8,
        top: _labelPosition(index, state, height),
        child: StepLabel(
          key: ValueKey(index),
          step: index + 1,
          state: _labelState(index, state),
          onTap: () => MementoStepper.of(context).jump(index),
        ),
      );

  double _labelPosition(int index, StepperState state, double height) =>
      index == state.step
          ? height / 2 - 12
          : index < state.step
              ? 32.0 * index
              : height - 32.0 * (steps.length - 1 - index) - 24;

  StepLabelState _labelState(int index, StepperState state) =>
      index == state.step
          ? StepLabelState.active
          : index < state.step
              ? steps[index].validator()
                  ? StepLabelState.ok
                  : StepLabelState.error
              : steps[index].validator()
                  ? StepLabelState.ok
                  : StepLabelState.standby;
}

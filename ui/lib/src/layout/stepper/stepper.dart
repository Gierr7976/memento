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
  final Axis axis;

  const MementoStepper({
    Key? key,
    required this.steps,
    this.axis = Axis.vertical,
  }) : super(key: key);

  static StepperCubit of(BuildContext context) => context.read();

  @override
  Widget build(BuildContext _) => Container(
        constraints: BoxConstraints(
          minWidth: axis == Axis.horizontal ? _minWidth : 0,
          minHeight: axis == Axis.vertical ? _minHeight : 0,
        ),
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
              onVerticalSwipe: axis == Axis.vertical
                  ? (direction) => _onVerticalSwipe(direction, context)
                  : null,
              onHorizontalSwipe: axis == Axis.horizontal
                  ? (direction) => _onHorizontalSwipe(direction, context)
                  : null,
            ),
          ),
        ),
      );

  void _onVerticalSwipe(SwipeDirection direction, BuildContext context) =>
      direction == SwipeDirection.down
          ? MementoStepper.of(context).scrollPrev()
          : MementoStepper.of(context).scrollNext();

  void _onHorizontalSwipe(SwipeDirection direction, BuildContext context) =>
      direction == SwipeDirection.right
          ? MementoStepper.of(context).scrollPrev()
          : MementoStepper.of(context).scrollNext();

  double get _minHeight => 16.0 + 32 * steps.length + 200;

  double get _minWidth => 16.0 + 32 * steps.length + 128;

  BlocBuilder _labels() => BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) => LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              for (int index = 0; index < steps.length; index++)
                _label(
                  context: context,
                  state: state,
                  index: index,
                  axisDimension: axis == Axis.vertical
                      ? constraints.maxHeight
                      : constraints.maxWidth,
                )
            ],
          ),
        ),
      );

  BlocBuilder _body() => BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) => StepperSlider(
          key: ValueKey(state.step),
          axis: axis,
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
    required double axisDimension,
  }) =>
      AnimatedPositioned(
        key: ValueKey(index),
        curve: Curves.easeInOut,
        width: 24,
        height: 24,
        duration: LONG_ANIMATION_DURATION,
        left: axis == Axis.horizontal
            ? _labelPosition(index, state, axisDimension)
            : 8,
        top: axis == Axis.vertical
            ? _labelPosition(index, state, axisDimension)
            : null,
        bottom: axis == Axis.horizontal ? 0 : null,
        child: StepLabel(
          key: ValueKey(index),
          step: index + 1,
          state: _labelState(index, state),
          onTap: () => MementoStepper.of(context).jump(index),
        ),
      );

  double _labelPosition(int index, StepperState state, double axisDimension) =>
      index == state.step
          ? axisDimension / 2 - 12
          : index < state.step
              ? 32.0 * index
              : axisDimension - 32.0 * (steps.length - 1 - index) - 24;

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

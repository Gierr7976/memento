import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_ui/src/logic/stepper.dart';
import 'package:memento_ui/src/misc/constants.dart';
import 'package:memento_ui/src/navigation/slider/slider.dart';
import 'package:memento_ui/src/navigation/stepper/label.dart';
import 'package:memento_ui/src/navigation/stepper/step.dart';

class MementoStepper extends StatelessWidget {
  final List<MementoStep> steps;
  final Axis axis;

  const MementoStepper({
    Key? key,
    required this.steps,
    this.axis = Axis.vertical,
  }) : super(key: key);

  static SliderCubit of(BuildContext context) => context.read();

  @override
  Widget build(BuildContext _) => Container(
        constraints: BoxConstraints(
          minWidth: axis == Axis.horizontal ? _minWidth : 0,
          minHeight: axis == Axis.vertical ? _minHeight : 0,
        ),
        child: MementoSlider(
          slides: [for (MementoStep step in steps) step.builder],
          axis: axis,
          additional: [
            _labels(),
          ],
        ),
      );

  double get _minHeight => 16.0 + 32 * steps.length + 200;

  double get _minWidth => 16.0 + 32 * steps.length + 128;

  BlocBuilder _labels() => BlocBuilder<SliderCubit, SliderState>(
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

  AnimatedPositioned _label({
    required BuildContext context,
    required SliderState state,
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

  double _labelPosition(int index, SliderState state, double axisDimension) =>
      index == state.slide
          ? axisDimension / 2 - 12
          : index < state.slide
              ? 32.0 * index
              : axisDimension - 32.0 * (steps.length - 1 - index) - 24;

  StepLabelState _labelState(int index, SliderState state) =>
      index == state.slide
          ? StepLabelState.active
          : index < state.slide
              ? steps[index].validator()
                  ? StepLabelState.ok
                  : StepLabelState.error
              : steps[index].validator()
                  ? StepLabelState.ok
                  : StepLabelState.standby;
}

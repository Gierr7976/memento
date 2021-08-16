import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_ui/src/layout/slider/animation.dart';
import 'package:memento_ui/src/logic/stepper.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class MementoSlider extends StatelessWidget {
  final Axis axis;
  final List<WidgetBuilder> slides;
  final List<Widget> additional;

  MementoSlider({
    Key? key,
    this.axis = Axis.vertical,
    required this.slides,
    this.additional = const [],
  }) : super(key: key);

  static SliderCubit of(BuildContext context) => context.read();

  @override
  Widget build(BuildContext _) => BlocProvider(
    create: (__) => SliderCubit(maxSlide: slides.length - 1),
    child: Builder(
      builder: (context) => SimpleGestureDetector(
        child: Stack(
          children: [
            _body(),
            ...additional,
          ],
        ),
        behavior: HitTestBehavior.translucent,
        onHorizontalSwipe: axis == Axis.horizontal
            ? (direction) => _onHorizontalSwipe(direction, context)
            : null,
        onVerticalSwipe: axis == Axis.vertical
            ? (direction) => _onVerticalSwipe(direction, context)
            : null,
      ),
    ),
  );

  BlocBuilder _body() => BlocBuilder<SliderCubit, SliderState>(
    builder: (context, state) => SliderAnimationBuilder(
      key: ValueKey(state.slide),
      axis: axis,
      slidingIn: slides[state.slide](context),
      slidingOut: state.prevSlide != null
          ? slides[state.prevSlide!](context)
          : null,
      direction: state.direction,
    ),
  );

  void _onVerticalSwipe(SwipeDirection direction, BuildContext context) =>
      direction == SwipeDirection.down
          ? MementoSlider.of(context).scrollPrev()
          : MementoSlider.of(context).scrollNext();

  void _onHorizontalSwipe(SwipeDirection direction, BuildContext context) =>
      direction == SwipeDirection.right
          ? MementoSlider.of(context).scrollPrev()
          : MementoSlider.of(context).scrollNext();
}

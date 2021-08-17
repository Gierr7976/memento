import 'package:flutter/material.dart';
import 'package:memento_ui/src/logic/stepper.dart';
import 'package:memento_ui/src/misc/constants.dart';

class SliderAnimationBuilder extends StatefulWidget {
  final Widget? slidingOut;
  final Widget slidingIn;
  final SliderDirection direction;
  final Axis axis;

  SliderAnimationBuilder({
    Key? key,
    this.slidingOut,
    required this.slidingIn,
    required this.direction,
    this.axis = Axis.vertical,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => axis == Axis.vertical
      ? _VerticalSliderAnimationBuilderState()
      : _HorizontalSliderAnimationBuilderState();
}

class _VerticalSliderAnimationBuilderState
    extends _SliderAnimationBuilderState {
  _VerticalSliderAnimationBuilderState()
      : super(
          prevPosition: Offset(0, -2),
          nextPosition: Offset(0, 2),
        );
}

class _HorizontalSliderAnimationBuilderState
    extends _SliderAnimationBuilderState {
  _HorizontalSliderAnimationBuilderState()
      : super(
          prevPosition: Offset(-2, 0),
          nextPosition: Offset(2, 0),
        );
}

abstract class _SliderAnimationBuilderState
    extends State<SliderAnimationBuilder> with SingleTickerProviderStateMixin {
  static const _CENTER = Offset(0, 0);

  final Offset prevPosition;
  final Offset nextPosition;

  late final AnimationController _controller;
  late final Animation<Offset> _slideInAnimation;
  late final Animation<Offset> _slideOutAnimation;

  _SliderAnimationBuilderState({
    required this.prevPosition,
    required this.nextPosition,
  });

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: LONG_ANIMATION_DURATION,
    );
    CurvedAnimation animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _slideInAnimation = Tween<Offset>(
      begin: widget.direction == SliderDirection.prev
          ? prevPosition
          : nextPosition,
      end: _CENTER,
    ).animate(animation);

    _slideOutAnimation = Tween<Offset>(
      begin: _CENTER,
      end: widget.direction == SliderDirection.prev
          ? nextPosition
          : prevPosition,
    ).animate(animation);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (context, _) => Stack(
          children: [
            if (widget.slidingOut != null)
              SlideTransition(
                position: _slideOutAnimation,
                child: widget.slidingOut,
              ),
            SlideTransition(
              position: _slideInAnimation,
              child: widget.slidingIn,
            ),
          ],
        ),
      );
}

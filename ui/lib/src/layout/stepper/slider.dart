import 'package:flutter/material.dart';
import 'package:memento_ui/src/logic/stepper.dart';
import 'package:memento_ui/src/misc/constants.dart';

class StepperSlider extends StatefulWidget {
  final Widget? slidingOut;
  final Widget slidingIn;
  final StepperDirection direction;

  StepperSlider({
    Key? key,
    this.slidingOut,
    required this.slidingIn,
    required this.direction,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => StepperSliderState();
}

class StepperSliderState extends State<StepperSlider>
    with SingleTickerProviderStateMixin {
  static const _DOWN = Offset(0, 2);
  static const _CENTER = Offset(0, 0);
  static const _UP = Offset(0, -2);

  late final AnimationController _controller;
  late final Animation<Offset> _slideInAnimation;
  late final Animation<Offset> _slideOutAnimation;

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
      begin: widget.direction == StepperDirection.up ? _UP : _DOWN,
      end: _CENTER,
    ).animate(animation);

    _slideOutAnimation = Tween<Offset>(
      begin: _CENTER,
      end: widget.direction == StepperDirection.up ? _DOWN : _UP,
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

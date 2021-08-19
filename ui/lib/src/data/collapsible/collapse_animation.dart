import 'package:flutter/material.dart';
import 'package:memento_ui/src/misc/constants.dart';

class CollapseAnimationBuilder extends StatefulWidget {
  final Widget child;
  final bool collapsed;

  const CollapseAnimationBuilder({
    Key? key,
    required this.child,
    this.collapsed = true,
  }) : super(key: key);

  @override
  _CollapseAnimationBuilderState createState() =>
      _CollapseAnimationBuilderState();
}

class _CollapseAnimationBuilderState extends State<CollapseAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationInit();

    _collapseCheck();
  }

  void _animationInit() {
    controller = AnimationController(
      vsync: this,
      duration: SMALL_ANIMATION_DURATION,
    );

    sizeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(covariant CollapseAnimationBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    _collapseCheck();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void _collapseCheck() {
    if (widget.collapsed)
      controller.reverse();
    else
      controller.forward();
  }

  @override
  Widget build(BuildContext context) => SizeTransition(
        axisAlignment: -1,
        sizeFactor: sizeAnimation,
        child: widget.child,
      );
}

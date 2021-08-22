import 'package:flutter/material.dart';
import 'package:memento_ui/src/data/collapsible/collapsible.dart';
import 'package:memento_ui/src/misc/constants.dart';

/// Виджет, реализующий анимацию сжатия/расширения для тела [MementoCollapsible].
class CollapseAnimationBuilder extends StatefulWidget {

  /// Содержимое тела.
  final Widget child;

  /// Состояние сжатия/расширения.
  final bool collapsed;

  /// Базовый конструктор.
  const CollapseAnimationBuilder({
    Key? key,
    required this.child,
    this.collapsed = true,
  }) : super(key: key);

  @override
  _CollapseAnimationBuilderState createState() =>
      _CollapseAnimationBuilderState();
}

/// Состояние [CollapseAnimationBuilder].
class _CollapseAnimationBuilderState extends State<CollapseAnimationBuilder>
    with SingleTickerProviderStateMixin {

  /// Контроллер анимации.
  late final AnimationController controller;

  /// Анимация сжатия/расширения.
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

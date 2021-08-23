import 'package:flutter/material.dart';
import 'package:memento_ui/src/logic/stepper.dart';
import 'package:memento_ui/src/misc/constants.dart';

/// Построитель анимации переключения слайдов. Для внутреннего пользования.
class SliderAnimationBuilder extends StatefulWidget {

  /// Уходящий слайд.
  final Widget? slidingOut;

  /// Приходящий слайд.
  final Widget slidingIn;

  /// Направление движения. См. [SliderDirection]
  final SliderDirection direction;

  /// Ось, по которой движутся слайды, по умолчанию [Axis.vertical]. См. [Axis].
  final Axis axis;

  /// Базовый констркутор.
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

/// Конкретизация [_SliderAnimationBuilderState] для переключений в
/// вертикальной оси. Для внутреннего пользования.
class _VerticalSliderAnimationBuilderState
    extends _SliderAnimationBuilderState {

  /// Базовый конструктор.
  _VerticalSliderAnimationBuilderState()
      : super(
          prevPosition: Offset(0, -2),
          nextPosition: Offset(0, 2),
        );
}

/// Конкретизация [_SliderAnimationBuilderState] для переключений в
/// горизонтальной оси. Для внутреннего пользования.
class _HorizontalSliderAnimationBuilderState
    extends _SliderAnimationBuilderState {

  /// Базовый конструктор.
  _HorizontalSliderAnimationBuilderState()
      : super(
          prevPosition: Offset(-2, 0),
          nextPosition: Offset(2, 0),
        );
}

/// Состояние [SliderAnimationBuilder], реализующее движение слайдов при
/// переключении. Для внутреннего пользования.
abstract class _SliderAnimationBuilderState
    extends State<SliderAnimationBuilder> with SingleTickerProviderStateMixin {

  /// Положение "центр". Для внутреннего пользования.
  static const _CENTER = Offset(0, 0);

  /// Положение предыдущего слайда с точки зрения пользователя.
  final Offset prevPosition;

  /// Положение следующего слайда с точки зрения пользователя.
  final Offset nextPosition;

  /// Контроллер анимации.
  ///
  /// Обратите внимание, что при уничтожении [_SliderAnimationBuilderState]
  /// [_controller] должен также уничтожаться:
  ///
  /// ```dart
  /// @override
  //  void dispose() {
  //     _controller.dispose();
  //     super.dispose();
  //  }
  /// ```
  late final AnimationController _controller;

  /// Анимация приходящего слайда.
  ///
  /// Движение происходит от направления [widget.direction] к центру.
  late final Animation<Offset> _slideInAnimation;

  /// Анимация уходящего слайда.
  ///
  /// Движение происходит от центра к противоположному [widget.direction]
  /// направлению.
  late final Animation<Offset> _slideOutAnimation;

  /// Базовый констркутор.
  _SliderAnimationBuilderState({
    required this.prevPosition,
    required this.nextPosition,
  });

  @override
  void initState() {
    super.initState();

    _initController();
    CurvedAnimation animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _initSlideInAnimation(animation);

    _initSlideOutAnimation(animation);

    _controller.forward();
  }

  /// Инициализирует [_slideOutAnimation].
  ///
  /// [Animation] — базовая анимация, управляемая [_controller], искажённая
  /// кривой.
  void _initSlideOutAnimation(CurvedAnimation animation) {
    _slideOutAnimation = Tween<Offset>(
      begin: _CENTER,
      end: widget.direction == SliderDirection.prev
          ? nextPosition
          : prevPosition,
    ).animate(animation);
  }

  /// Инициализирует [_slideInAnimation].
  ///
  /// [Animation] — базовая анимация, управляемая [_controller], искажённая
  /// кривой.
  void _initSlideInAnimation(CurvedAnimation animation) {
    _slideInAnimation = Tween<Offset>(
      begin: widget.direction == SliderDirection.prev
          ? prevPosition
          : nextPosition,
      end: _CENTER,
    ).animate(animation);
  }

  /// Инициализирует [_controller].
  void _initController() {
    _controller = AnimationController(
      vsync: this,
      duration: LONG_ANIMATION_DURATION,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
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
      );
}

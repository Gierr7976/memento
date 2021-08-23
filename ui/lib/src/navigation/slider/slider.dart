import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_ui/src/logic/stepper.dart';
import 'package:memento_ui/src/navigation/slider/animation.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

/// Виджет, размещающий в себе другие виджеты как слайды.
class MementoSlider extends StatelessWidget {

  /// Направление, в котором движутся слайды.
  final Axis axis;

  /// Построители виджетов-слайдов.
  final List<WidgetBuilder> slides;

  /// Дополнительные слои: кнопки управления, индикаторы и т.п.
  final List<Widget> additional;

  /// Базовый конструктор.
  MementoSlider({
    Key? key,
    this.axis = Axis.vertical,
    required this.slides,
    this.additional = const [],
  }) : super(key: key);

  /// Возвращает [SliderCubit], управляющий пролистыванием.
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
            onHorizontalSwipe: _getHorizontalSwipeCallback(context),
            onVerticalSwipe: _getVerticalSwipeCallback(context),
          ),
        ),
      );

  /// Возвращает функцию-обработчик события свайпа по вертикальной оси,
  /// если слайды расположены по ней.
  Function(SwipeDirection)? _getVerticalSwipeCallback(BuildContext context) =>
      axis == Axis.vertical
          ? (direction) => _onVerticalSwipe(direction, context)
          : null;

  /// Возвращает функцию-обработчик события свайпа по горизонтальной оси,
  /// если слайды расположены по ней.
  Function(SwipeDirection)? _getHorizontalSwipeCallback(BuildContext context) =>
      axis == Axis.horizontal
          ? (direction) => _onHorizontalSwipe(direction, context)
          : null;

  BlocBuilder _body() => BlocBuilder<SliderCubit, SliderState>(
        builder: (context, state) => state.prevSlide != null
            ? SliderAnimationBuilder(
                key: ValueKey(state.slide),
                axis: axis,
                slidingIn: slides[state.slide](context),
                slidingOut: slides[state.prevSlide!](context),
                direction: state.direction,
              )
            : slides[state.slide](context),
      );

  /// Переключает слайд по вертикальной оси зависимости от направления свайпа.
  void _onVerticalSwipe(SwipeDirection direction, BuildContext context) =>
      direction == SwipeDirection.down
          ? MementoSlider.of(context).scrollPrev()
          : MementoSlider.of(context).scrollNext();

  /// Переключает слайд по горизонтальной оси в зависимости от
  /// направления свайпа.
  void _onHorizontalSwipe(SwipeDirection direction, BuildContext context) =>
      direction == SwipeDirection.right
          ? MementoSlider.of(context).scrollPrev()
          : MementoSlider.of(context).scrollNext();
}

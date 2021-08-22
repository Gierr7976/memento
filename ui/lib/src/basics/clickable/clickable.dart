import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/ground/ground.dart';
import 'package:memento_ui/src/misc/constants.dart';

/// Базовый виджет для всех виджетов, с которыми пользователь взаимодействует
/// посредством касаний и нажатий.
///
/// <br>
/// **Обратите внимание:** размер [Clickable] должен быть не меньше 48x48.
@immutable
abstract class Clickable extends StatelessWidget
    with MementoColorThemeUserMixin {
  /// Ограничения по умолчанию, устанавливающие минимальный размер [Clickable]
  /// соответствующий минимально допустимому.
  static const DEFAULT_CONSTRAINTS =
      BoxConstraints(minWidth: 48, minHeight: 48);

  /// Содержимое, размещаемое внутри виджета.
  final Widget child;

  /// Ограничения по размеру.
  final BoxConstraints constraints;

  /// То, что произойдёт, когда пользователь коснётся [Clickable].
  final GestureTapCallback? onTap;

  /// То, что произойдёт, когда пользователь зажмёт [Clickable].
  final GestureLongPressCallback? onLongPress;

  /// Доступность [Clickable] для пользовательских взаимодействий.
  final bool enabled;

  /// Граница [Clickable], передаваемая [Ground]. См. [BoxBorder].
  final BoxBorder? border;

  /// Форма [Clickable], [BoxShape.rectangle] или [BoxShape.circle].
  final BoxShape shape;

  /// Тени, передаваемые [Ground].
  final List<BoxShadow>? shadow;

  /// Длительность анимации [Ground]
  final Duration duration;

  /// Базовый конструктор.
  Clickable({
    Key? key,
    required this.child,
    required this.constraints,
    this.duration = SMALL_ANIMATION_DURATION,
    this.shape = BoxShape.rectangle,
    this.onTap,
    this.enabled = true,
    this.border,
    this.shadow,
    this.onLongPress,
  }) : super(key: key);

  /// Определяет цвет, передаваемый [Ground]. Если [Clickable] недоступен для
  /// пользовательских взаимодействий, цветом [Ground] служит фоновый цвет
  /// темы.
  ///
  /// <br>
  /// Наследники [Clickable] должны переопределять этот метод, при этом вызывая
  /// его и подставляя в параметр [color] цвет, который будет передан [Ground],
  /// если [Clickable] доступен для пользовательских взаимодействий.
  @mustCallSuper
  Color getColor(BuildContext context, [Color? color]) =>
      enabled ? color! : colorTheme(context).background;

  @override
  Widget build(BuildContext context) => _ground(
        context: context,
        child: _clipper(
          _touch(
            context: context,
            child: child,
          ),
        ),
      );

  Ground _ground({required BuildContext context, required Widget child}) =>
      Ground(
        duration: duration,
        shape: shape,
        color: getColor(context),
        constraints: constraints,
        child: child,
        border: border,
        borderRadius:
            shape == BoxShape.rectangle ? GENERIC_BORDER_RADIUS : null,
        shadow: enabled? shadow : null,
      );

  Widget _touch({required BuildContext context, required Widget child}) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          child: child,
          onTap: enabled ? onTap : null,
          onLongPress: enabled ? onLongPress : null,
          splashColor: Colors.black12,
        ),
      );

  Widget _clipper(Widget child) {
    switch (shape) {
      case BoxShape.rectangle:
        return _roundedRectangleClipper(child);
      case BoxShape.circle:
        return _circleClipper(child);
    }
  }

  Widget _roundedRectangleClipper(Widget child) => ClipRRect(
        borderRadius: GENERIC_BORDER_RADIUS,
        child: child,
      );

  Widget _circleClipper(Widget child) => ClipOval(
        child: child,
      );
}

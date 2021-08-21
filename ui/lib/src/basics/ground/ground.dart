import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/misc/constants.dart';

/// Виджет-подложка.
///
/// Предполагается, что фон простых по форме элементов (прямоугольных, круглых)
/// будет создаваться посредством [Ground].
@immutable
class Ground extends StatelessWidget {
  /// Форма подложки. [BoxShape.rectangle] или [BoxShape.circle]
  final BoxShape shape;

  /// Цвет подложки, как правило либо соответствующий фоновому, либо основному
  /// цвету темы.
  final Color color;

  /// Ограничения по размеру. См. [BoxConstraints]
  final BoxConstraints constraints;

  /// Тени подложки. Предполагается использование одного из вариантов,
  /// представленных в [MementoElevations].
  final List<BoxShadow>? shadow;

  /// Радиус скругления подложки. См. [BorderRadius].
  final BorderRadius? borderRadius;

  /// Граница подложки. См. [BoxBorder].
  final BoxBorder? border;

  /// Содержимое, размещённое на подложке.
  final Widget child;

  /// Длительность анимации изменения, по умолчанию [SMALL_ANIMATION_DURATION].
  /// Влияет только на параметры, переданные непосредственно [AnimatedContainer]
  /// внутри [Ground].
  ///
  /// <br>
  /// **Обратите внимание:** изменение размеров [child] не вызывает анимацию
  /// подложки, см. [AnimatedContainer].
  final Duration duration;

  /// Базовый конструктор.
  Ground({
    Key? key,
    required this.shape,
    required this.color,
    required this.constraints,
    this.duration = SMALL_ANIMATION_DURATION,
    this.shadow,
    this.borderRadius,
    this.border,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: duration,
        curve: Curves.easeInOut,
        constraints: constraints,
        decoration: BoxDecoration(
            color: color,
            shape: shape,
            borderRadius: borderRadius,
            border: border,
            boxShadow: shadow),
        child: child,
      );
}

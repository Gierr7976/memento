import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:memento_ui/src/misc/constants.dart';

/// Тип функции-построителя визуализации элемента [MementoListing].
///
/// T — класс визуализируемых данных.
typedef ElementRepresentationBuilder<T> = Widget Function(
    BuildContext context, int index, T element);

/// Виджет для визуализации перечней данных, например смен.
///
/// T — класс визуализируемых данных.
class MementoListing<T> extends StatelessWidget {

  /// Отступ между элементами перечня по умолчанию.
  static const DEFAULT_ITEM_INTERVAL = 8.0;

  /// Список элементов, который будет визуализирован. По умолчанию пустой.
  final List<T> elements;

  /// Построитель, визуализирующий элементы. См. [ElementRepresentationBuilder].
  final ElementRepresentationBuilder<T> builder;

  /// Отступ между элементами перечня. По умолчанию равен
  /// `DEFAULT_ITEM_INTERVAL`.
  final double itemInterval;

  /// Базовый конструктор.
  MementoListing({
    Key? key,
    this.elements = const [],
    required this.builder,
    this.itemInterval = DEFAULT_ITEM_INTERVAL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: GENERIC_BORDER_RADIUS,
        child: ListView.builder(
          itemBuilder: _buildPaddedElement,
          itemCount: elements.length,
        ),
      );

  Widget _buildPaddedElement(BuildContext context, int index) =>
      index < elements.length - 1
          ? Padding(
              padding: EdgeInsets.only(bottom: itemInterval),
              child: buildElement(context, index),
            )
          : buildElement(context, index);

  Widget buildElement(BuildContext context, int index) =>
      builder(context, index, elements[index]);
}

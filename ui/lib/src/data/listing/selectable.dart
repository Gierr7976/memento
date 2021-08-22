import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_ui/src/data/listing/listing.dart';
import 'package:memento_ui/src/logic/listing_selection.dart';

/// Тип функции-построителя визуализации элемента [MementoSelectableListing].
///
/// T — класс визуализируемых данных.
typedef SelectableElementRepresentationBuilder<T> = Widget
    Function(BuildContext context, int index, T element, [bool selected]);

/// Виджет для визуализации перечней данных, например смен. В отличие от
/// [MementoListing] содержит логику, отвественную за работу с состоянием
/// выбора элементов.
///
/// T — класс визуализируемых данных.
///
/// Использует [ListingSelectionCubit], хранящий состояния "выбран/не выбран"
/// для каждого элемента. Подразумевается, что элемент
/// [MementoSelectableListing] соотносится с состоянием "выбран/не выбран" в
/// [ListingSelectionCubit] через индекс, т.е у каждого элемента
/// [MementoSelectableListing] с индексом *i* состояние "выбран/не выбран"
/// находится в [state[i]] соответствующего [ListingSelectionCubit].
class MementoSelectableListing<T> extends MementoListing<T> {

  /// Построитель, визуализирующий элементы.
  /// См. [SelectableElementRepresentationBuilder].
  final SelectableElementRepresentationBuilder<T> builder;

  /// Возвращает [ListingSelectionCubit], отвественный за работу с состоянием
  /// выбора элементов.
  static ListingSelectionCubit of(BuildContext context) => context.read();

  /// Базовый констркутор.
  MementoSelectableListing({
    Key? key,
    required this.builder,
    List<T> elements = const [],
    double itemInterval = MementoListing.DEFAULT_ITEM_INTERVAL,
  }) : super(
          key: key,
          builder: builder,
          elements: elements,
          itemInterval: itemInterval,
        );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (__) => ListingSelectionCubit.zero(elements.length),
        child: super.build(context),
      );

  @override
  Widget buildElement(BuildContext _, int index) =>
      BlocBuilder<ListingSelectionCubit, List<bool>>(
        buildWhen: (previous, current) => previous[index] != current[index],
        builder: (context, state) =>
            builder(context, index, elements[index], state[index]),
      );
}

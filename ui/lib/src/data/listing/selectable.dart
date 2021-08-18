import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_ui/src/data/listing/listing.dart';
import 'package:memento_ui/src/logic/listing_selection.dart';

typedef SelectableElementRepresentationBuilder<T> = Widget
    Function(BuildContext context, int index, T element, [bool selected]);

class MementoSelectableListing<T> extends MementoListing<T> {
  final SelectableElementRepresentationBuilder<T> builder;

  static ListingSelectionCubit of(BuildContext context) => context.read();

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

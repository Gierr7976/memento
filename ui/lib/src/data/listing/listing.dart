import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:memento_ui/src/misc/constants.dart';

typedef ElementRepresentationBuilder<T> = Widget Function(
    BuildContext context, int index, T element);

class MementoListing<T> extends StatelessWidget {
  static const DEFAULT_ITEM_INTERVAL = 8.0;

  final List<T> elements;
  final ElementRepresentationBuilder<T> builder;
  final double itemInterval;

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

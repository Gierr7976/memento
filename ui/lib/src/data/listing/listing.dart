import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:memento_ui/src/misc/constants.dart';

typedef ElementRepresentationBuilder<T> = Widget Function(
    BuildContext context, ListingElement<T> element);

@immutable
class ListingElement<T> {
  final T data;

  ListingElement({
    required this.data,
  });

  static List<ListingElement<T>> fromDataList<T>(List<T> dataList) => [
        for (T data in dataList) ListingElement(data: data),
      ];

  ListingElement<T> copyWith({
    T? data,
  }) =>
      ListingElement(
        data: data ?? this.data,
      );

  @override
  bool operator ==(Object other) =>
      other is ListingElement<T> ? data == other.data : false;
}

class MementoListing<T> extends StatelessWidget {
  static const DEFAULT_ITEM_INTERVAL = 8.0;

  final List<ListingElement<T>> elements;
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
          itemBuilder: (context, index) => index < elements.length - 1
              ? Padding(
                  padding: EdgeInsets.only(bottom: itemInterval),
                  child: builder(context, elements[index]),
                )
              : builder(context, elements[index]),
          itemCount: elements.length,
        ),
      );
}

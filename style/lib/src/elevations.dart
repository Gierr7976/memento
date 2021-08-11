import 'package:flutter/widgets.dart';
import 'package:memento_style/src/colors.dart';

abstract class MementoElevations {
  static final List<BoxShadow> inset = [
    BoxShadow(
      color: MementoColors.dark2.withOpacity(0.32),
      offset: Offset(0, 0.5),
      blurRadius: -4,
    )
  ];

  static final List<BoxShadow> e1 = [
    BoxShadow(
      color: MementoColors.dark1.withOpacity(0.16),
      blurRadius: 1,
    ),
    BoxShadow(
      color: MementoColors.dark3.withOpacity(0.16),
      blurRadius: 2,
      offset: Offset(0.5, 1),
    )
  ];

  static final List<BoxShadow> e2 = [
    BoxShadow(
      color: MementoColors.dark1.withOpacity(0.08),
      blurRadius: 1,
    ),
    BoxShadow(
      color: MementoColors.dark3.withOpacity(0.16),
      blurRadius: 4,
      offset: Offset(1, 2),
    )
  ];

  static final List<BoxShadow> e3 = [
    BoxShadow(
      color: MementoColors.dark1.withOpacity(0.08),
      blurRadius: 2,
    ),
    BoxShadow(
      color: MementoColors.dark3.withOpacity(0.16),
      blurRadius: 8,
      offset: Offset(3, 6),
    )
  ];

  static final List<BoxShadow> e4 = [
    BoxShadow(
      offset: Offset(0, 2),
      color: MementoColors.dark1.withOpacity(0.08),
      blurRadius: 4,
    ),
    BoxShadow(
      color: MementoColors.dark3.withOpacity(0.16),
      blurRadius: 16,
      offset: Offset(4, 8),
    )
  ];

  static final List<BoxShadow> e5 = [
    BoxShadow(
      offset: Offset(1.5, 3),
      color: MementoColors.dark1.withOpacity(0.08),
      blurRadius: 8,
    ),
    BoxShadow(
      color: MementoColors.dark3.withOpacity(0.16),
      blurRadius: 24,
      offset: Offset(8, 16),
    )
  ];

  static final List<BoxShadow> e6 = [
    BoxShadow(
      offset: Offset(0, 2),
      color: MementoColors.dark1.withOpacity(0.08),
      blurRadius: 8,
    ),
    BoxShadow(
      color: MementoColors.dark3.withOpacity(0.24),
      blurRadius: 32,
      offset: Offset(10, 20),
    )
  ];
}

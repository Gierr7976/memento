import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'colors.dart';

abstract class MementoColorTheme {
  static MementoColorTheme of(BuildContext context) => context.watch();

  Color get background;

  Color get text;

  Color get semiDimmedText;

  Color get almostDimmedText;

  Color get dimmedText;

  Color get primary;

  Color get strongOk;

  Color get ok;

  Color get dimmedOk;

  Color get error;

  Color get dimmedError;

  Color get warning;
}

class BrightTheme extends MementoColorTheme {
  // Background

  @override
  Color get background => MementoColors.light1;

  // Text

  @override
  Color get text => MementoColors.dark1;

  @override
  Color get semiDimmedText => MementoColors.dark2;

  @override
  Color get almostDimmedText => MementoColors.dark3;

  @override
  Color get dimmedText => MementoColors.dark4;

  // Primary

  @override
  Color get primary => MementoColors.orange1;

  // Ok

  @override
  Color get strongOk => MementoColors.green0;

  @override
  Color get ok => MementoColors.green1;

  @override
  Color get dimmedOk => MementoColors.green4;

  // Error

  @override
  Color get error => MementoColors.red1;

  @override
  Color get dimmedError => MementoColors.red4;

  // Warning

  @override
  Color get warning => MementoColors.yellow2;
}

mixin MementoColorThemeUserMixin {

  MementoColorTheme colorTheme(BuildContext context) =>
      MementoColorTheme.of(context);

}

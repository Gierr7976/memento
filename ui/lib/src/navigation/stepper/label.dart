import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/misc/constants.dart';

enum StepLabelState { standby, active, ok, error }

@immutable
class StepLabel extends StatelessWidget with MementoColorThemeUserMixin {
  static const double _SIZE = 24;

  final int step;
  final StepLabelState state;
  final GestureTapCallback? onTap;

  StepLabel({
    Key? key,
    required this.step,
    this.state = StepLabelState.standby,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedClickable(
        child: Center(
          child: _label(context),
        ),
        onTap: onTap,
        color: _color(context),
        shape: BoxShape.circle,
        constraints: BoxConstraints.tightFor(
          width: _SIZE,
          height: _SIZE,
        ),
        duration: LONG_ANIMATION_DURATION,
      );

  Text _label(BuildContext context) => Text(
        '$step',
        style:
            MementoText.body16.copyWith(color: colorTheme(context).background),
      );

  Color _color(BuildContext context) {
    switch (state) {
      case StepLabelState.standby:
        return colorTheme(context).almostDimmedText;
      case StepLabelState.active:
        return colorTheme(context).primary;
      case StepLabelState.ok:
        return colorTheme(context).ok;
      case StepLabelState.error:
        return colorTheme(context).error;
    }
  }
}

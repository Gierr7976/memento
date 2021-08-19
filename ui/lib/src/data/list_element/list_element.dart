import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/misc/constants.dart';
import 'package:memento_ui/src/tabler_icons.dart';

class MementoListElement extends StatelessWidget
    with MementoColorThemeUserMixin {
  final String title;
  final String? description;
  final bool selected;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  MementoListElement({
    Key? key,
    required this.title,
    this.description,
    this.selected = false,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatClickable(
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
          child: Row(
            children: [
              _texts(context),
              _marker(context),
            ],
          ),
        ),
        onTap: onTap,
        onLongPress: onLongPress,
      );

  Widget _texts(BuildContext context) => Expanded(
        child: description != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_title(context), _description(context)],
              )
            : _title(context),
      );

  Padding _description(BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          description!,
          style: MementoText.small
              .copyWith(color: colorTheme(context).almostDimmedText),
          softWrap: true,
        ),
      );

  Text _title(BuildContext context) => Text(
        title,
        style: MementoText.mediumLabel
            .copyWith(color: colorTheme(context).semiDimmedText),
        softWrap: true,
      );

  Widget _marker(BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 16),
        child: AnimatedSwitcher(
          duration: FLASH_ANIMATION_DURATION,
          child: selected
              ? _selectionMarker(context)
              : onTap != null
                  ? _clickableMarker(context)
                  : Container(
                      width: 24,
                    ),
        ),
      );

  Icon _selectionMarker(BuildContext context) => Icon(
        TablerIcons.circle_check,
        key: ValueKey('check'),
        size: 24,
        color: colorTheme(context).ok,
      );

  Icon _clickableMarker(BuildContext context) => Icon(
        TablerIcons.chevron_right,
        key: ValueKey('chevron'),
        size: 24,
        color: colorTheme(context).semiDimmedText,
      );
}

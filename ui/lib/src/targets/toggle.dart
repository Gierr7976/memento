import 'package:flutter/widgets.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/clickable.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/basics/toggleable.dart';
import 'package:memento_ui/src/tabler_icons.dart';

class MementoToggle extends Toggleable {
  final String title;
  final String? description;
  final bool enabled;

  MementoToggle({
    Key? key,
    required this.title,
    this.description,
    bool initialState = false,
    OnToggleCallback? onToggle,
    this.enabled = true,
  }) : super(
          key: key,
          initialState: initialState,
          onToggle: onToggle,
        );

  @override
  Widget builder(BuildContext context, bool state) => _ground(context, state);

  Clickable _ground(BuildContext context, bool state) => FlatClickable(
        child: _content(context, state),
        enabled: enabled,
        color: state ? MementoColorTheme.of(context).dimmedOk : null,
        onTap: () => tap(state, context),
      );

  Padding _content(BuildContext context, bool state) => Padding(
        padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: description != null
                  ? _withDescription(context, state)
                  : _title(context, state),
            ),
            _icon(state, context),
          ],
        ),
      );

  Column _withDescription(BuildContext context, bool state) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _title(context, state),
          _description(state, context),
        ],
      );

  Padding _icon(bool state, BuildContext context) => Padding(
        padding: EdgeInsets.only(left: 16),
        child: Icon(
          state ? TablerIcons.check : TablerIcons.x,
          size: 24,
          color: _titleColor(state, context),
        ),
      );

  Padding _description(bool state, BuildContext context) => Padding(
        padding: EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          description!,
          style: MementoText.small.copyWith(
            color: _descriptionColor(state, context),
          ),
          textAlign: TextAlign.justify,
          softWrap: true,
        ),
      );

  Color _descriptionColor(bool state, BuildContext context) => enabled
      ? state
          ? MementoColorTheme.of(context).ok
          : MementoColorTheme.of(context).almostDimmedText
      : MementoColorTheme.of(context).dimmedText;

  Widget _title(BuildContext context, bool state) => Text(
        title,
        style: MementoText.mediumLabel.copyWith(
          color: _titleColor(state, context),
        ),
        softWrap: true,
      );

  Color _titleColor(bool state, BuildContext context) => enabled
      ? state
          ? MementoColorTheme.of(context).strongOk
          : MementoColorTheme.of(context).semiDimmedText
      : MementoColorTheme.of(context).dimmedText;
}

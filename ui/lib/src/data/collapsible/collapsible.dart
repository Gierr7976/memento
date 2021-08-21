import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/basics/toggleable.dart';
import 'package:memento_ui/src/data/collapsible/collapse_animation.dart';
import 'package:memento_ui/src/tabler_icons.dart';

class MementoCollapsible extends Toggleable with MementoColorThemeUserMixin {
  final WidgetBuilder headerBuilder;
  final WidgetBuilder bodyBuilder;
  final bool collapsed;

  MementoCollapsible(
      {Key? key,
      required this.headerBuilder,
      required this.bodyBuilder,
      this.collapsed = true})
      : super(key: key);

  @override
  Widget builder(BuildContext context, bool state) => FlatClickable(
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
          child: Column(
            children: [
              _header(context, state),
              _body(context, state),
            ],
          ),
        ),
        onTap: () => tap(context, state),
      );

  CollapseAnimationBuilder _body(BuildContext context, bool state) =>
      CollapseAnimationBuilder(
        child: Padding(
          padding: EdgeInsets.only(top: 8),
          child: bodyBuilder(context),
        ),
        collapsed: !state,
      );

  Widget _header(BuildContext context, bool state) => Row(
        children: [
          Expanded(
            child: headerBuilder(context),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Icon(
              state ? TablerIcons.chevron_up : TablerIcons.chevron_down,
              size: 24,
              color: colorTheme(context).semiDimmedText,
            ),
          ),
        ],
      );
}

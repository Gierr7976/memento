import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';

class MementoMenuButton extends StatelessWidget
    with MementoColorThemeUserMixin {
  final String text;
  final IconData icon;
  final Color? contentColor;
  final Color? groundColor;
  final bool enabled;
  final GestureTapCallback? onTap;

  MementoMenuButton({
    Key? key,
    required this.text,
    required this.icon,
    this.enabled = true,
    this.contentColor,
    this.groundColor,
    this.onTap,
  }) : super(key: key);

  Color _getContentColor(BuildContext context) => enabled
      ? contentColor ?? colorTheme(context).semiDimmedText
      : colorTheme(context).dimmedText;

  @override
  Widget build(BuildContext context) => FlatClickable(
        constraints: BoxConstraints(minWidth: 156, minHeight: 100),
        color: groundColor,
        enabled: enabled,
        onTap: onTap,
        child: _content(context),
      );

  Widget _content(BuildContext context) => Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(
                icon,
                size: 32,
                color: _getContentColor(context),
              ),
            ),
            Text(
              text,
              style:
                  MementoText.small.copyWith(color: _getContentColor(context)),
            ),
          ],
        ),
      );
}

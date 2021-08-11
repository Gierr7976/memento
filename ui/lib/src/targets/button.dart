import 'package:flutter/widgets.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/misc/clickable.dart';

enum ButtonAlignment {
  left,
  center,
  right,
}

@immutable
class MementoButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final ButtonAlignment alignment;
  final GestureTapCallback? onTap;
  final bool flat;
  final BoxConstraints? constraints;
  final bool enabled;
  final Color? color;
  final Color? backgroundColor;

  MementoButton({
    Key? key,
    this.text,
    this.icon,
    this.alignment = ButtonAlignment.center,
    this.onTap,
    this.flat = true,
    this.constraints,
    this.enabled = true,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Clickable(
        flat: flat,
        onTap: onTap,
        constraints: constraints,
        enabled: enabled,
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            top: 5,
            right: 16,
            bottom: 11,
          ),
          child: Row(
            mainAxisAlignment: _rowAlignment(),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: _buildContent(context),
          ),
        ),
      );

  List<Widget> _buildContent(BuildContext context) {
    List<Widget> content = [
      if (icon != null)
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Icon(
            icon,
            size: 32,
            color: _contentColor(context),
          ),
        ),
      if (text != null)
        alignment == ButtonAlignment.center
            ? _text(context)
            : Expanded(child: _text(context)),
      if (icon != null && text != null)
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Container(
            width: 32,
            height: 32,
          ),
        ),
    ];
    return alignment == ButtonAlignment.right
        ? content.reversed.toList()
        : content;
  }

  Color _contentColor(BuildContext context) => enabled
      ? color ??
          (flat
              ? MementoColorTheme.of(context).primary
              : MementoColorTheme.of(context).background)
      : MementoColorTheme.of(context).dimmedText;

  MainAxisAlignment _rowAlignment() {
    switch (alignment) {
      case ButtonAlignment.left:
        return MainAxisAlignment.start;
      case ButtonAlignment.center:
        return MainAxisAlignment.center;
      case ButtonAlignment.right:
        return MainAxisAlignment.end;
    }
  }

  Widget _text(BuildContext context) => Text(
        text!,
        style: MementoText.mediumLabel
            .copyWith(color: _contentColor(context), height: 1.7),
        textAlign: TextAlign.center,
      );
}

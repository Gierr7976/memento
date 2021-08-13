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
        child: _body(context),
      );

  Padding _body(BuildContext context) => Padding(
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
          children: _content(context),
        ),
      );

  List<Widget> _content(BuildContext context) {
    List<Widget> content = [
      if (icon != null) _icon(context),
      if (text != null) _alignedText(context),
      if (icon != null && text != null) _counterIndent(),
    ];
    return alignment == ButtonAlignment.right
        ? content.reversed.toList()
        : content;
  }

  Padding _counterIndent() => Padding(
        padding: EdgeInsets.only(left: 16),
        child: Container(
          width: 32,
          height: 32,
        ),
      );

  Widget _alignedText(BuildContext context) =>
      alignment == ButtonAlignment.center
          ? _text(context)
          : Expanded(child: _text(context));

  Padding _icon(BuildContext context) => Padding(
        padding: EdgeInsets.only(right: 16),
        child: Icon(
          icon,
          size: 32,
          color: _contentColor(context),
        ),
      );

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
        style: MementoText.mediumLabel.copyWith(color: _contentColor(context)),
        textAlign: TextAlign.center,
      );
}

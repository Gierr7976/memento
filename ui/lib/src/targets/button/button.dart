import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/clickable.dart';

enum ButtonAlignment { left, center, right }

abstract class Button extends StatelessWidget with MementoColorThemeUserMixin {
  final ButtonAlignment alignment;
  final String? text;
  final IconData? icon;
  final BoxShape shape;
  final BoxConstraints? constraints;
  final bool enabled;
  final GestureTapCallback? onTap;
  final BoxBorder? border;

  Button({
    Key? key,
    this.text,
    this.icon,
    this.shape = BoxShape.rectangle,
    this.enabled = true,
    this.constraints,
    this.onTap,
    this.border,
    this.alignment = ButtonAlignment.center,
  })  : assert(text != null || icon != null),
        super(key: key);

  Clickable clickable({required BuildContext context, required Widget child});

  @override
  Widget build(BuildContext context) => clickable(
        context: context,
        child: _paddedContent(context),
      );

  @mustCallSuper
  Color getContentColor(BuildContext context, [Color? contentColor]) =>
      enabled ? contentColor! : colorTheme(context).dimmedText;

  @mustCallSuper
  Color getGroundColor(BuildContext context, [Color? groundColor]) =>
      enabled ? groundColor! : colorTheme(context).background;

  Padding _paddedContent(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          top: 5,
          right: 16,
          bottom: 11,
        ),
        child: Row(
          mainAxisAlignment: _contentAlignment,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _content(context),
        ),
      );

  List<Widget> _content(BuildContext context) {
    List<Widget> content = [
      if (icon != null) _icon(context),
      if (text != null) _alignedText(context),
      if (text != null && icon != null) _counterIndent,
    ];

    return alignment == ButtonAlignment.right
        ? content.reversed.toList()
        : content;
  }

  MainAxisAlignment get _contentAlignment {
    switch (alignment) {
      case ButtonAlignment.left:
        return MainAxisAlignment.start;
      case ButtonAlignment.center:
        return MainAxisAlignment.center;
      case ButtonAlignment.right:
        return MainAxisAlignment.end;
    }
    throw UnimplementedError('Should be unreachable');
  }

  Text _text(BuildContext context) => Text(
        text!,
        style:
            MementoText.mediumLabel.copyWith(color: getContentColor(context)),
        textAlign: TextAlign.center,
        softWrap: true,
      );

  Widget _indentedText(BuildContext context) => icon != null
      ? Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: _text(context),
        )
      : _text(context);

  Widget _alignedText(BuildContext context) =>
      alignment != ButtonAlignment.center
          ? Expanded(
              child: _indentedText(context),
            )
          : _indentedText(context);

  Icon _icon(BuildContext context) => Icon(
        icon,
        size: 32,
        color: getContentColor(context),
      );

  Container get _counterIndent => Container(
        width: 32,
        height: 32,
      );
}

import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/clickable.dart';

/// Виды размещения содержимого кнопки.
enum ButtonAlignment {
  /// Иконка слева, текст по центру.
  left,

  /// Иконка и текст по центру.
  center,

  /// Иконка справа, текст по центру.
  right,
}

/// Базовый виджет-кнопка. Для внутреннего пользования.
///
/// <br>
/// **Обратите внимание:** размер [Button] должен быть не меньше 48x48.
abstract class Button extends StatelessWidget with MementoColorThemeUserMixin {
  /// Расположение содержимого внутри кнопки. См. [ButtonAlignment].
  final ButtonAlignment alignment;

  /// Текст кнопки. Если [null], соответствующий [Text] исключается.
  final String? text;

  /// Иконка кнопки. Если [null], соответствующий [Icon] исключается.
  final IconData? icon;

  /// Форма кнопки, передаваемая [Clickable].
  final BoxShape shape;

  /// Ограничения кнопки по размеру, передаваемые [Clickable].
  final BoxConstraints? constraints;

  /// Доступность кнопки для пользовательских взаимодействий.
  final bool enabled;

  /// То, что произойдёт, когда пользователь коснётся кнопки.
  final GestureTapCallback? onTap;

  /// Границы кнопки, передаваемые [Clickable].
  final BoxBorder? border;

  /// Базовый конструктор. Или [text], или [icon] должен быть не равен [null].
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

  /// Возвращает [Clickable], внутри которого размещается содержимое.
  ///
  /// [child] — содержимое, которое необходимо разместить внутри [Clickable].
  Clickable clickable({required BuildContext context, required Widget child});

  @override
  Widget build(BuildContext context) => clickable(
        context: context,
        child: _paddedContent(context),
      );

  /// Возвращает цвет содержимого. Если кнопка недоступна для пользовательских
  /// взаимодействий, цветом содержимого служит цвет заглушённого текста темы.
  ///
  /// Наследники [Button] должны переопределять этот метод, при этом вызывая
  /// его и подставляя в параметр [color] цвет содержимого для тех случаев,
  /// когда [Clickable] доступен для пользовательских взаимодействий.
  @mustCallSuper
  Color getContentColor(BuildContext context, [Color? contentColor]) =>
      enabled ? contentColor! : colorTheme(context).dimmedText;

  /// Определяет цвет, передаваемый [Ground]. Если [Button] недоступен для
  /// пользовательских взаимодействий, цветом [Ground] служит фоновый цвет
  /// темы.
  ///
  /// <br>
  /// Наследники [Button] должны переопределять этот метод, при этом вызывая
  /// его и подставляя в параметр [color] цвет, который будет передан [Ground],
  /// если [Button] доступен для пользовательских взаимодействий.
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

import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';

class MementoAvatar extends StatelessWidget with MementoColorThemeUserMixin {
  final Color color;
  final String label;

  const MementoAvatar({
    Key? key,
    required this.color,
    required this.label,
  })  : assert(label.length == 1),
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            label,
            style: MementoText.body16
                .copyWith(color: colorTheme(context).background),
          ),
        ),
      );
}

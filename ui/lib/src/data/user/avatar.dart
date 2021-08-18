import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';

class AvatarData {
  final Color color;
  final String label;

  AvatarData({
    required this.color,
    required this.label,
  });
}

class MementoAvatar extends StatelessWidget with MementoColorThemeUserMixin {
  final AvatarData avatar;

  MementoAvatar({
    Key? key,
    required this.avatar,
  })  : assert(avatar.label.length == 1),
        super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: avatar.color,
        ),
        child: Center(
          child: Text(
            avatar.label,
            style: MementoText.body16
                .copyWith(color: colorTheme(context).background),
          ),
        ),
      );
}

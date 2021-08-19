import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/basics/clickable/variants.dart';
import 'package:memento_ui/src/data/user/avatar.dart';

class AvatarCard extends StatelessWidget with MementoColorThemeUserMixin {
  final AvatarData avatar;
  final String title;
  final String description;
  final List<Widget> addons;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  AvatarCard({
    Key? key,
    required this.avatar,
    required this.title,
    required this.description,
    this.addons = const [],
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FlatClickable(
        child: Padding(
          padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
          child: Row(
            children: [
              MementoAvatar(
                avatar: avatar,
              ),
              _text(context),
              ...addons,
            ],
          ),
        ),
        onTap: onTap,
        onLongPress: onLongPress,
      );

  Expanded _text(BuildContext context) => Expanded(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Container(
            constraints: BoxConstraints(minHeight: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(context),
                Container(
                  height: 18,
                ),
                _description(context),
              ],
            ),
          ),
        ),
      );

  Text _title(BuildContext context) => Text(
        title,
        style: MementoText.lead.copyWith(color: colorTheme(context).text),
        softWrap: true,
      );

  Text _description(BuildContext context) => Text(
        description,
        style: MementoText.small
            .copyWith(color: colorTheme(context).almostDimmedText, height: 0.5),
        softWrap: true,
      );
}

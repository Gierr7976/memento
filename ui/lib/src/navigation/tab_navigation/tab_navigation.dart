import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/logic/stepper.dart';
import 'package:memento_ui/src/misc/constants.dart';
import 'package:memento_ui/src/navigation/slider/slider.dart';
import 'package:memento_ui/src/targets/circle_button.dart';

class MementoTab {
  final WidgetBuilder builder;
  final IconData icon;

  MementoTab({required this.builder, required this.icon});
}

class MementoTabNavigation extends StatelessWidget
    with MementoColorThemeUserMixin {
  final List<MementoTab> tabs;

  MementoTabNavigation({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MementoSlider(
        slides: [for (MementoTab tab in tabs) tab.builder],
        axis: Axis.horizontal,
        additional: [_buttons()],
      );

  Positioned _buttons() => Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: BlocBuilder<SliderCubit, SliderState>(
          builder: (context, state) => Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (int index = 0; index < tabs.length; index++)
                _button(context, state, index)
            ],
          ),
        ),
      );

  AnimatedPadding _button(BuildContext context, SliderState state, int index) =>
      AnimatedPadding(
        padding: EdgeInsets.only(bottom: _isCurrent(index, state) ? 16 : 0),
        duration: MEDIUM_ANIMATION_DURATION,
        curve: Curves.easeInOut,
        child: MementoCircleButton(
          icon: tabs[index].icon,
          color: _buttonIconColor(context, state, index),
          small: false,
          onTap: () => MementoSlider.of(context).jump(index),
        ),
      );

  Color _buttonIconColor(
    BuildContext context,
    SliderState state,
    int index,
  ) {
    return _isCurrent(index, state)
        ? colorTheme(context).primary
        : colorTheme(context).almostDimmedText;
  }

  bool _isCurrent(int index, SliderState state) => index == state.slide;
}

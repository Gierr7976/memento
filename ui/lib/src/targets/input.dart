import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/logic/input.dart';
import 'package:memento_ui/src/misc/constants.dart';
import 'package:memento_ui/src/tabler_icons.dart';

class MementoInput extends StatelessWidget {
  final IconData? standbyIcon;
  final IconData errorIcon;
  final IconData validIcon;

  final String caption;
  final String? initialData;
  final bool Function(String)? validator;

  final FocusNode focusNode;
  final TextEditingController controller;

  MementoInput({
    Key? key,
    this.standbyIcon,
    this.errorIcon = TablerIcons.alert_triangle,
    this.validIcon = TablerIcons.circle_check,
    required this.caption,
    this.initialData,
    this.validator,
    required this.focusNode,
  })  : controller = TextEditingController(text: initialData),
        super(key: key);

  @override
  Widget build(BuildContext _) => BlocProvider<InputCubit>(
        create: (__) {
          InputCubit cubit = InputCubit(
            initialData: initialData,
            validator: validator ?? (text) => text.isNotEmpty,
          );
          return cubit;
        },
        child: BlocBuilder<InputCubit, InputState>(
          builder: (context, state) => AnimatedContainer(
            duration: SMALL_ANIMATION_DURATION,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: GENERIC_BORDER_RADIUS,
              color: MementoColorTheme.of(context).background,
              boxShadow: MementoElevations.inset,
              border: Border.all(color: _color(context, state, true), width: 1),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: GENERIC_BORDER_RADIUS,
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: AnimatedSwitcher(
                          duration: SMALL_ANIMATION_DURATION,
                          child: state.data.isNotEmpty
                              ? Align(
                                  key: ValueKey(state.data.isNotEmpty),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    caption,
                                    style: MementoText.tiny.copyWith(
                                        color: _color(context, state)),
                                  ),
                                )
                              : Align(
                                  key: ValueKey(state.data.isNotEmpty),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    caption,
                                    style: MementoText.body16.copyWith(
                                        color: MementoColorTheme.of(context)
                                            .almostDimmedText),
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: EditableText(
                                controller: controller,
                                style: MementoText.body16.copyWith(
                                    color: MementoColorTheme.of(context).text),
                                cursorColor:
                                    MementoColorTheme.of(context).primary,
                                backgroundCursorColor:
                                    MementoColorTheme.of(context)
                                        .almostDimmedText,
                                focusNode: focusNode
                                  ..addListener(() {
                                    InputCubit cubit = context.read();
                                    if (focusNode.hasFocus)
                                      cubit.focus();
                                    else
                                      cubit.unfocus();
                                  }),
                                onChanged: (text) =>
                                    context.read<InputCubit>().update(text),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: AnimatedSwitcher(
                                  duration: SMALL_ANIMATION_DURATION,
                                  child: state.valid ||
                                          state.error ||
                                          standbyIcon != null
                                      ? Icon(
                                          state.valid
                                              ? validIcon
                                              : state.error
                                                  ? errorIcon
                                                  : standbyIcon,
                                          key: UniqueKey(),
                                          size: 24,
                                          color: _color(context, state),
                                        )
                                      : Container(
                                          width: 24,
                                          height: 24,
                                        ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => focusNode.requestFocus(),
              ),
            ),
          ),
        ),
      );

  Color _color(BuildContext context, InputState state, [bool dim = false]) =>
      state.focused
          ? MementoColorTheme.of(context).primary
          : state.valid
              ? MementoColorTheme.of(context).ok
              : state.error
                  ? MementoColorTheme.of(context).error
                  : dim
                      ? MementoColorTheme.of(context).dimmedText
                      : MementoColorTheme.of(context).almostDimmedText;
}

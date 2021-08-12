import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/logic/toggle.dart';
import 'package:memento_ui/src/misc/clickable.dart';
import 'package:memento_ui/src/tabler_icons.dart';

class MementoToggle extends StatelessWidget {
  final String title;
  final String? description;
  final bool initialState;
  final void Function(bool)? onToggle;
  final bool enabled;

  MementoToggle({
    Key? key,
    required this.title,
    this.description,
    this.initialState = false,
    this.onToggle,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) => BlocProvider<ToggleCubit>(
        create: (__) => ToggleCubit(initialState),
        child: BlocBuilder<ToggleCubit, bool>(
          builder: (context, state) => Clickable(
            child: Padding(
              padding: EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: description != null
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildTitle(context, state),
                              Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Text(
                                  description!,
                                  style: MementoText.small.copyWith(
                                    color: enabled
                                        ? state
                                            ? MementoColorTheme.of(context).ok
                                            : MementoColorTheme.of(context)
                                                .almostDimmedText
                                        : MementoColorTheme.of(context)
                                            .dimmedText,
                                  ),
                                  textAlign: TextAlign.justify,
                                  softWrap: true,
                                ),
                              ),
                            ],
                          )
                        : _buildTitle(context, state),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(
                      state ? TablerIcons.check : TablerIcons.x,
                      size: 24,
                      color: enabled
                          ? state
                              ? MementoColorTheme.of(context).strongOk
                              : MementoColorTheme.of(context).semiDimmedText
                          : MementoColorTheme.of(context).dimmedText,
                    ),
                  ),
                ],
              ),
            ),
            enabled: enabled,
            color: state && enabled
                ? MementoColorTheme.of(context).dimmedOk
                : null,
            onTap: () {
              onToggle?.call(!state);
              context.read<ToggleCubit>().toggle();
            },
          ),
        ),
      );

  Widget _buildTitle(BuildContext context, bool state) => Text(
        title,
        style: MementoText.mediumLabel.copyWith(
          color: enabled
              ? state
                  ? MementoColorTheme.of(context).strongOk
                  : MementoColorTheme.of(context).semiDimmedText
              : MementoColorTheme.of(context).dimmedText,
        ),
        softWrap: true,
      );
}

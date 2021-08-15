import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/layout/stepper/step.dart';
import 'package:memento_ui/src/layout/stepper/stepper.dart';
import 'package:memento_ui/src/tabler_icons.dart';
import 'package:memento_ui/src/targets/button.dart';

import 'preset.dart';

void main() {
  TestPreset(child: StepperTest()).run();
}

class StepperTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MementoStepper(
        steps: [
          MementoStep(
            validator: () => false,
            builder: (context) => Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text('1', style: MementoText.display1,),
                  ),
                ),
                MementoButton(
                  icon: TablerIcons.chevron_down,
                  onTap: () => MementoStepper.of(context).scrollNext(),
                )
              ],
            ),
          ),
          MementoStep(
            builder: (context) => Column(
              children: [
                MementoButton(
                  icon: TablerIcons.chevron_up,
                  onTap: () => MementoStepper.of(context).scrollPrev(),
                ),
                Expanded(
                  child: Center(
                    child: Text('2', style: MementoText.display1,),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

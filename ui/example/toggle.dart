import 'package:flutter/material.dart';
import 'package:memento_ui/src/targets/toggle.dart';

import 'preset.dart';

void main(){
  TestPreset(child: ToggleTest()).run();
}

class ToggleTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Column(
    children: [
      MementoToggle(
        key: UniqueKey(),
        title: 'Переключатель',
        initialState: true,
      ),
      MementoToggle(
        title: 'Переключатель с описанием',
        description: 'Я опять сегодня прыгаю на кровати, потому что у меня всё в лимонаде',
      ),
    ],
    mainAxisAlignment: MainAxisAlignment.spaceAround,
  );

}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memento_style/memento_style.dart';
import 'package:memento_ui/src/tabler_icons.dart';
import 'package:memento_ui/src/targets/button.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MaterialApp(
    home: Main(),
  ));
}

class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Provider<MementoColorTheme>(
    create: (_) => BrightTheme(),
    child: Material(
      color: MementoColors.light1,
      child: Center(
        child: Container(
          width: 360,
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 64),
            child: Column(
              children: [
                MementoButton(
                  icon: TablerIcons.chevron_left,
                  alignment: ButtonAlignment.left,
                  text: 'Кнопка',
                  flat: false,
                  onTap: (){},
                ),
                MementoButton(
                  icon: TablerIcons.check,
                  text: 'Кнопка',
                  enabled: false,
                  onTap: (){},
                ),
                MementoButton(
                  icon: TablerIcons.chevron_right,
                  alignment: ButtonAlignment.right,
                  text: 'Кнопка',
                  color: MementoColors.green1,
                  backgroundColor: MementoColors.green4,
                  onTap: (){},
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

}
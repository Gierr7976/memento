import 'package:flutter/material.dart';
import 'package:memento_style/memento_style.dart';
import 'package:provider/provider.dart';

class TestPreset extends StatelessWidget {
  final Widget child;

  const TestPreset({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext _) => Provider<MementoColorTheme>(
        create: (__) => BrightTheme(),
        child: Builder(
          builder: (context) => Scaffold(
            backgroundColor: MementoColorTheme.of(context).background,
            body: Center(
              child: Container(
                width: 360,
                child: child,
                margin:
                    EdgeInsets.only(left: 16, top: 64, right: 16, bottom: 8),
              ),
            ),
          ),
        ),
      );

  void run() {
    runApp(MaterialApp(
      home: this,
    ));
  }
}

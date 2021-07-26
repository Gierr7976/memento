import 'package:flutter/material.dart';
import 'package:memento_site/presentation/banner.dart';
import 'package:memento_style/memento_style.dart';

void main(){
  runApp(MaterialApp(
    home: SoonBanner(),
    title: 'Memento',
    theme: ThemeData(
      canvasColor: MementoColors.light1,
    ),
  ));
}
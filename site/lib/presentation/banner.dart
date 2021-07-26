import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:memento_style/memento_style.dart';

class SoonBanner extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Material(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/logo.svg', height: 240,),
        Padding(
          padding: EdgeInsets.only(top: 128),
          child: Text(
            'Memento',
            style: MementoText.display2,
          ),
        ),
        Text(
          'Q3 2021',
          style: MementoText.h4,
        ),
      ],
    ),
  );

}
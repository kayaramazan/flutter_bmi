import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants.dart';
class Contain extends StatelessWidget {
  Contain({@required this.colour,this.widget});
  final Color colour;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget,
      margin:EdgeInsets.all(ScreenHeight/50),
      decoration: BoxDecoration(
        color: colour,
        borderRadius:BorderRadius.circular(10),
      ),
    );
  }
}

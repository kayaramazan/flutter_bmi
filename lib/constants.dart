import 'dart:math';

import 'package:flutter/material.dart';
const bottomHeight=80.0;
double bmi;
double ScreenHeight;
const cardColor=Color(0xFF1D1E33);
const activeCardColor=Color(0xFF111328);
const bottomColor=Color(0xFFEB1555);
const labelTextStyle=TextStyle(fontSize: 18,color: Color(0xFF8E8D98));
const boldLabelStyle=TextStyle(fontSize: 50.0,fontWeight:FontWeight.w900);
double calcBmi(int height,int weight,int age)
{
  double height2=height/100;
  print(height2);
  var result=(weight/pow(height2,2)).toStringAsFixed(2);

  return num.parse(result);
}
String getState(double result)
{
  if(result<18.5)
    return "UNDERWEIGHT";
  else if(result<24.9)
    return "NORMAL";
  else if(result <29.9)
    return "OVERWEIGHT";
  else
    return 'OBESE';

}
String getInfo(double result)
{
  if(result<18.5)
    return "You should eat more.";
  else if(result<24.9)
    return "Congrats!! You have normal body.";
  else if(result <29.9)
    return "Your weight higher than normal body, try to exercise.";
  else
    return 'Sorry :( You are an obese.';
}
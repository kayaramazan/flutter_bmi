import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'contain.dart';
import 'result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum Gender
{
   male,
   female
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender=Gender.male;
  int height=180;
  int weight=60;
  int age=20;
  @override
  Widget build(BuildContext context) {
   ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),

      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(

              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                     setState(() {
                       selectedGender=Gender.male;
                     });
                    },
                    child: Contain(colour: selectedGender==Gender.male?activeCardColor:cardColor,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child:Icon(
                              FontAwesomeIcons.mars,
                              size: 80.0,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text('MALE',style: labelTextStyle
                              ,),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: ()
                    {
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    child: Contain(colour: selectedGender==Gender.female?activeCardColor:cardColor,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: Icon(
                              FontAwesomeIcons.venus,
                              size: 80.0,
                            ),
                          ),

                          Expanded(
                              flex: 1,
                              child: Text('FEMALE',style:labelTextStyle))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Contain(
            colour: cardColor,
            widget:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: labelTextStyle,textAlign: TextAlign.center),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic ,
                  children: <Widget>[
                    Text('$height',style: boldLabelStyle,textAlign: TextAlign.center),
                    Text('cm',style: labelTextStyle,)
                  ],
                ),
                Slider(
                     value: height.toDouble(),
                     min: 120.0,
                     max: 220.0,
                     inactiveColor: Colors.grey,
                     activeColor: Colors.pink.shade500,
                     label: '$height',
                     onChanged: (double newValue) {
                       setState(() {
                         height=newValue.round();
                       });
                    },
                     onChangeEnd: (double newValue) {
                       print('Ended change on $newValue');
                     },
                   )

              ],
            ),
              )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Contain(colour: cardColor,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: labelTextStyle,),
                        Text('$weight',style: boldLabelStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn3',
                              backgroundColor:Color(0xFF4C4F5E),
                              child: Icon(Icons.add,color: Colors.white,),
                              onPressed: ()
                              {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            FloatingActionButton(
                              heroTag: 'btn4',
                              backgroundColor:Color(0xFF4C4F5E),
                              child: Icon(Icons.remove,color: Colors.white,size: 12,),
                              onPressed: ()
                              {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )

                      ],
                    ),)),
                Expanded(child: Contain(colour: cardColor,
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: labelTextStyle,),
                        Text('$age',style: boldLabelStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn1',
                              backgroundColor:Color(0xFF4C4F5E),
                              child: Icon(Icons.add,color: Colors.white,),
                              onPressed: ()
                              {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            FloatingActionButton(
                              heroTag: 'btn2',
                              backgroundColor:Color(0xFF4C4F5E),
                              child: Icon(Icons.remove,color: Colors.white,),
                              onPressed: ()
                              {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        )

                      ],
                    )
                )),
              ],
            ),
          ),
          Container(
            color: bottomColor,
            margin: EdgeInsets.only(top: 15.0),
            width: double.infinity,
            height:bottomHeight,
            child:new FlatButton(
              child: Text('CALCULATE',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
              onPressed: ()
              {
                bmi=calcBmi(height,weight,age);
                Navigator.pushNamed(context,'/result');
              },
            ),
          )
        ],
      )
    );
  }
}

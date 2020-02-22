import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/constants.dart';
import 'contain.dart';
class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Contain(
                colour: cardColor,
              widget: Column
                (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                      getState(bmi),
                      style: TextStyle(color: Colors.green,fontSize:21,fontWeight: FontWeight.w900),textAlign: TextAlign.center),
                  Text('$bmi',style: TextStyle(fontSize: 75,fontWeight: FontWeight.w900),textAlign: TextAlign.center,),
                  Text(getInfo(bmi),style:labelTextStyle,textAlign: TextAlign.center,)
                ],
              ),
              ),
            ),
            Container(
              color: bottomColor,
              margin: EdgeInsets.only(top: 15.0),
              width: double.infinity,
              height:bottomHeight,
              child:new FlatButton(
                child: Text('RE-CALCULATE',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                onPressed: ()
                {
                  Navigator.pop(context,'/result');
                },
              ),
            )
          ],
        ),
      )
    );
  }
}

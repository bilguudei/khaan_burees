import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class TxtTotal extends StatelessWidget{

  String total;
  TxtTotal({this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text("Нийт үнэ:  ", style: TextStyle(color: cText(), fontSize: 30),),
        Text("$total₮", style: TextStyle(color: cText(), fontSize: 30, fontWeight: FontWeight.bold),),
      ],
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

}
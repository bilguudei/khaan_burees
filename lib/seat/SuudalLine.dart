import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class SuudalLine extends StatelessWidget{

  Color color;


  SuudalLine({this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        color: color != null ? color : cDefaultBlack(),
      ),
      width: 100,
      height: 1,
    );
  }

}
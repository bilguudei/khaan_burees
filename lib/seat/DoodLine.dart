import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class DoodLine extends StatefulWidget{

  Color color;


  DoodLine({this.color});

  @override
  State<StatefulWidget> createState() {
    return doodLine();
  }

}

class doodLine extends State<DoodLine>{

  double width = 1;
  double height = 125;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: widget.color != null ?  widget.color : cDefaultBlack(),
        ),
      ),
      width: width,
      height: height,
    );
  }

}
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class Der extends StatefulWidget{

  String img;


  Der({this.img});

  @override
  State<StatefulWidget> createState() {
    return der();
  }

}

class der extends State<Der>{
  double w = 120;
  double h = 90;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          SizedBox(
            child: ClipRRect(
              child: Container(color: cDefaultBlack(),),
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(45, 75),
                  topLeft: Radius.elliptical(45, 75),
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)
              ),
              clipBehavior: ui.Clip.antiAliasWithSaveLayer,
            ),
            width: w,
            height: h,
          ),
          SizedBox(
            child: ClipRRect(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 8,) :  Container(color: cDefaultGrey3(),),
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(45, 75),
                  topLeft: Radius.elliptical(45, 75),
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)
              ),
              clipBehavior: ui.Clip.antiAliasWithSaveLayer,
            ),
            width: w - 2,
            height: h - 2,
          ),
        ],
        alignment: Alignment.center,
      ),
      width: w,
      height: h,
    );
  }

}
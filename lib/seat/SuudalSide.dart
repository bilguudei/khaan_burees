import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class SuudalSide extends StatefulWidget{

  String img;


  SuudalSide({this.img});

  @override
  State<StatefulWidget> createState() {
    return suudalSide();
  }

}

class suudalSide extends State<SuudalSide>{

  double width = 70;
  double height = 60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          SizedBox(
            child: ClipRRect(
              child: Container(color: cDefaultBlack(),),
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(25, 45),
                  bottomRight: Radius.elliptical(150, 130),
                  bottomLeft: Radius.circular(30)
              ),
              clipBehavior: ui.Clip.antiAliasWithSaveLayer,
            ),
            width: width,
            height: height,
          ),
          SizedBox(
            child: ClipRRect(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 4,) :  Container(color: cDefaultGrey2()),
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(25, 45),
                  bottomRight: Radius.elliptical(150, 130),
                  bottomLeft: Radius.circular(30)
              ),
              clipBehavior: ui.Clip.antiAliasWithSaveLayer,
            ),
            width: width - 2,
            height: height - 2,
          ),
        ],
        alignment: Alignment.center,
      ),
      width: width,
      height: height,
    );
  }

}
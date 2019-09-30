import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class HulGol extends StatefulWidget{

  String img;
  HulGol({this.img});

  @override
  State<StatefulWidget> createState() {
    return hulGol();
  }

}

class hulGol extends State<HulGol>{
  double w = 160;
  double h = 60;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[
          SizedBox(
            child: ClipRRect(
              child: Container(color: cDefaultBlack(),),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
              ),
              clipBehavior: ui.Clip.antiAliasWithSaveLayer,
            ),
            width: w,
            height: h,
          ),
          SizedBox(
            child: ClipRRect(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 1,) :  Container(color: cDefaultGrey1()),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
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
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class SuudalDood extends StatefulWidget{

  String img;
  SuudalDood({this.img});

  @override
  State<StatefulWidget> createState() {
    return suudalDood();
  }

}

class suudalDood extends State<SuudalDood>{
  double w = 160;
  double h = 25;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            child: ClipPath(
              child: Container(color: cDefaultBlack(),),
              clipper: ClipSuudalDood(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            height: h,
            width: w,
          ),
          SizedBox(
            child: ClipPath(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 2,) :  Container(color: cDefaultGrey1(),),
              clipper: ClipSuudalDood(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            height: h - 2,
            width: w - 2,
          ),
        ],
      ),
      height: h,
      width: w,
    );
  }

}

class ClipSuudalDood extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(8, 0);
    path.lineTo(size.width - 8, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(8, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
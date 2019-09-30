import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class SuudalGol extends StatefulWidget{
  String img;
  double width;

  SuudalGol({this.img, this.width});

  @override
  State<StatefulWidget> createState() {
    return suudalGol();
  }

}

class suudalGol extends State<SuudalGol>{

  double h = 35;
  double w = 144;
  double width = 0;

  @override
  void initState() {
    super.initState();

    if(widget.width != null)
      width = widget.width;
    else width = w;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            child: ClipPath(
              child: Container(color: cDefaultBlack(),),
              clipper: ClipSuudalGol(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            height: h,
            width: width,
          ),
          SizedBox(
            child: ClipPath(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale:2,) :  Container(color: cDefaultGrey1()),
              clipper: ClipSuudalGol(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            height: h - 2,
            width: width - 2,
          ),
        ],
      ),
      height: h,
      width: width,
    );
  }

}

class ClipSuudalGol extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(10, 0);
    path.lineTo(size.width - 10, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class NuruuGol extends StatefulWidget{
  String img;

  NuruuGol({this.img});

  @override
  State<StatefulWidget> createState() {
    return nuruuGol();
  }

}

class nuruuGol extends State<NuruuGol>{

  double w = 140;
  double h = 130;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            child: ClipPath(
              child: Container(color: cDefaultBlack(),),
              clipper: ClipNuruuGol(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            height: h,
            width: w,
          ),
          SizedBox(
            child: ClipPath(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 7,) :  Container(color: cDefaultGrey1()),
              clipper: ClipNuruuGol(),
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

class ClipNuruuGol extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width/2, 0, size.width, 20);
    path.lineTo(size.width, size.height );
    path.quadraticBezierTo(size.width / 2, size.height - 10, 0, size.height);
    path.lineTo(0, size.height - 20);


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
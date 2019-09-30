import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class DoodSide extends StatefulWidget{
  String img;

  DoodSide({this.img});

  @override
  State<StatefulWidget> createState() {
    return doodSide();
  }

}

class doodSide extends State<DoodSide>{

  double w = 55;
  double h = 160;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            child: ClipPath(
              child: Container(color: cDefaultBlack(),),
              clipper: ClipDoodSide(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            width: w,
            height: h,
          ),
          SizedBox(
            child: ClipPath(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 7,) :  Container(color: cDefaultGrey2(),),
              clipper: ClipDoodSide(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            width: w - 2,
            height: h - 2,
          )
        ],
      ),
      height: h,
      width: w,
    );
  }

}

class ClipDoodSide extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 40);
    path.lineTo(size.width - 10, 0);
    path.lineTo(size.width, size.height);
//    path.quadraticBezierTo(0, size.height, size.width, size.height - 20);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
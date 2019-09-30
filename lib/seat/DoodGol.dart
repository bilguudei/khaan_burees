import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class DoodGol extends StatefulWidget{
  String img;

  DoodGol({this.img});

  @override
  State<StatefulWidget> createState() {
    return doodGol();
  }

}

class doodGol extends State<DoodGol>{

  double w = 140;
  double h = 160;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: <Widget>[

          SizedBox(
            child: ClipPath(
              child: Container(
                color: cDefaultBlack(),
              ),
              clipper: ClipDoodGol(),
            ),
            height: h,
            width: w,
          ),
          SizedBox(
            child: ClipPath(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 7,) :  Container(color: cDefaultGrey1()),
              clipper: ClipDoodGol(),
            ),
            width: w - 2,
            height: h - 2,
          ),
        ],
        alignment: Alignment.center,
      ),
      height: h,
      width: w,
    );
  }

}

class ClipDoodGolBorder extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width/2, 0, size.width, 20);
    path.lineTo(size.width, size.height - 10 );
    path.quadraticBezierTo(size.width / 2, size.height, 0, size.height - 10);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth=1.0
      ..color = Colors.red;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ClipDoodGol extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 20);
    path.quadraticBezierTo(size.width/2, 0, size.width, 20);
    path.lineTo(size.width, size.height - 10 );
    path.quadraticBezierTo(size.width / 2, size.height, 0, size.height - 10);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
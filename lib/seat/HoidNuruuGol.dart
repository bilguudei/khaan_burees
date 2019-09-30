import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:khaan_burees/util/ColorSeat.dart';

class HoidNuruuGol extends StatefulWidget{
  String img;
  double height;

  HoidNuruuGol({this.img, this.height});

  @override
  State<StatefulWidget> createState() {
    return hoidNuruuGol();
  }

}

class hoidNuruuGol extends State<HoidNuruuGol>{

  double w = 80;
  double h = 130;
  double height;

  @override
  void initState() {
    super.initState();
    if(widget.height != null)
      height = widget.height;
    else height = h;

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: cDefaultBlack(), width: 1)
              ),
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 7,) :  Container(color: cDefaultGrey2()),
            ),
            height: height,
            width: w,
          ),
        ],
      ),
      height: height,
      width: w,
    );
  }

}

//class ClipNuruuGol extends CustomClipper<Path>{
//  @override
//  Path getClip(Size size) {
//    Path path = Path();
//    path.lineTo(0, 20);
//    path.quadraticBezierTo(size.width/2, 0, size.width, 20);
//    path.lineTo(size.width, size.height );
//    path.quadraticBezierTo(size.width / 2, size.height - 10, 0, size.height);
//    path.lineTo(0, size.height - 20);
//
//
//    return path;
//  }
//
//  @override
//  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
//
//}
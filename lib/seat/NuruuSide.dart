import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class NuruuSide extends StatefulWidget{
  String img;

  NuruuSide({this.img});

  @override
  State<StatefulWidget> createState() {
    return nuruuSide();
  }

}

class nuruuSide extends State<NuruuSide>{

  double w = 45;
  double h = 150;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
            SizedBox(
            child: ClipPath(
              child: Container(color: cDefaultBlack(),),
              clipper: ClipNuruuSide(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            width: w,
            height: h,
          ),
          SizedBox(
            child: ClipPath(
              child: widget.img.length > 0 ? Image.asset("images/texture/${widget.img}", repeat: ImageRepeat.repeat, scale: 1,) :  Container(color: cDefaultGrey2(),),
              clipper: ClipNuruuSide(),
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

class ClipNuruuSide extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 40);
    path.quadraticBezierTo(size.width/2 - 5, 0, size.width - 5, 40);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}
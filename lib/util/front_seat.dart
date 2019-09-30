import 'package:flutter/material.dart';
import 'package:khaan_burees/seat/Der.dart';
import 'package:khaan_burees/seat/NuruuGol.dart';
import 'package:khaan_burees/seat/DoodGol.dart';
import 'package:khaan_burees/seat/DoodLine.dart';
import 'package:khaan_burees/seat/SuudalGol.dart';
import 'package:khaan_burees/seat/SuudalLine.dart';
import 'package:khaan_burees/seat/HulGol.dart';
import 'package:khaan_burees/seat/HulSide.dart';
import 'package:khaan_burees/seat/SuudalDood.dart';
import 'package:khaan_burees/seat/NuruuSide.dart';
import 'package:khaan_burees/seat/SuudalSide.dart';
import 'package:khaan_burees/seat/DoodSide.dart';
import 'package:khaan_burees/util/ColorSeat.dart';


Widget FrontSeat({String imgGol, String imgZah, double seatWidth, double seatHeight, String imgZuragDeed, String imgZuragDood}){
  return SizedBox(
    child: Stack(
      children: <Widget>[

        //---------------------Hul Side-------------------------
        Positioned(
          top: 345,
          right: 20,
          child: HulSide(img: "$imgZah",),
        ),
        Positioned(
          top: 345,
          left: 20,
          child: Transform(
            child: HulSide(img: "$imgZah",),
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateX(6)
              ..rotateY(-3),
            alignment: FractionalOffset.center,
          ),
        ),
        //---------------------Hul Side-------------------------
        Positioned(
          top: 0,
          left: seatWidth / 2 - 60,
          child: Der(img: "$imgGol",),
        ),
        Positioned(
          top: 80,
          left: seatWidth / 2 - 70,
          child: NuruuGol(img: "$imgGol"),
        ),
        Positioned(
          top: 180,
          left: seatWidth / 2 - 70,
          child: DoodGol(img: "$imgGol"),
        ),
        //------------------------Dood Side----------------------------
        Positioned(
          top: 175,
          right: 28,
          child: DoodSide(img: "$imgZah",),
        ),
        Positioned(
          top: 175,
          left: 28,
          child: Transform(
            child: DoodSide(img: "$imgZah",),
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateX(6)
              ..rotateY(-3),
            alignment: FractionalOffset.center,
          ),
        ),
        //------------------------Dood Side----------------------------

        //------------------------Suudal Side----------------------
        Positioned(
            top: 330,
            right: 20,
            child: SuudalSide(img: "$imgZah",)
        ),
        Positioned(
            top: 330,
            left: 20,
            child: Transform(
              child: SuudalSide(img: "$imgZah",),
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // perspective
                ..rotateX(6.3)
                ..rotateY(-3.5),
              alignment: FractionalOffset.center,
            )
        ),
        //------------------------Suudal Side----------------------
        Positioned(
          top: 330,
          left: seatWidth / 2 - 72,
          child: SuudalGol(img: "$imgGol"),
        ),
        Positioned(
          top: 365,
          left: seatWidth / 2 - 80,
          child: SuudalDood(img: "$imgGol"),
        ),

        Positioned(
          top: 388,
          left: seatWidth / 2 - 80,
          child: HulGol(img: "$imgGol"),
        ),

        //-----------Nuruu Side-------------------------
        Positioned(
          top: 70,
          left: 38,
          child: Transform(
            child: NuruuSide(img: "$imgZah",),
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateX(6)
              ..rotateY(-3),
            alignment: FractionalOffset.center,
          ),
        ),
        Positioned(
          top: 70,
          right: 38,
          child: NuruuSide(img: "$imgZah",),
        ),
        //-----------Nuruu Side-------------------------

        //------------Suudal Line----------------------
        Positioned(
          top: 200,
          right: 60,
          child: DoodLine(color: cDefaultBlack(),),
        ),
        Positioned(
          top: 200,
          left: 60,
          child: DoodLine(color: cDefaultBlack(),),
        ),
        //------------Suudal Line----------------------

        //-------------Nuruu Line-------------------
        Positioned(
          top: 220,
          left: 100,
          child: SuudalLine(color: cDefaultBlack(),),
        ),
        Positioned(
          top: 250,
          left: 100,
          child: SuudalLine(color: cDefaultBlack(),),
        ),
        Positioned(
          top: 280,
          left: 100,
          child: SuudalLine(color: cDefaultBlack(),),
        ),
        //-------------Nuruu Line-------------------

        Positioned(
          top: 30,
          left: 120,
          child: Image.asset("images/texture/$imgZuragDeed", width: 60, height: 40,),
        ),

        Positioned(
          top: 130,
          left: 110,
          child: Image.asset("images/texture/$imgZuragDood", width: 80, height: 50,),
        ),
      ],
    ),
    width: seatWidth,
    height: seatHeight,
  );
}
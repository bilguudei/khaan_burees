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
import 'package:khaan_burees/seat/HoidNuruuGol.dart';


Widget RearSeat({String imgGol, String imgZah, double seatWidth, double seatHeight, String imgZuragDeed, String imgZuragDood}){
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
//Nuruu Right=====================================================================================================
      //=====================================================================================================
        //---------------------Hul Side-------------------------
        Positioned(
          top: 0,
          right: 90,
          child: Der(img: "$imgGol",),
        ),
        Positioned(
          top: 80,
          right: 80,
          child: NuruuGol(img: "$imgGol"),
        ),
        Positioned(
          top: 180,
          right: 80,
          child: DoodGol(img: "$imgGol"),
        ),
        //------------------------Suudal Side----------------------
        Positioned(
          top: 330,
          right: 80,
          child: SuudalGol(img: "$imgGol", width: 150,),
        ),
        Positioned(
          top: 365,
          right: 80,
          child: SuudalDood(img: "$imgGol"),
        ),

        Positioned(
          top: 388,
          right: 80,
          child: HulGol(img: "$imgGol"),
        ),
        //-------------Nuruu Line-------------------
        Positioned(
          top: 220,
          right: 100,
          child: SuudalLine(color: cDefaultBlack(),),
        ),
        Positioned(
          top: 250,
          right: 100,
          child: SuudalLine(color: cDefaultBlack(),),
        ),
        Positioned(
          top: 280,
          right: 100,
          child: SuudalLine(color: cDefaultBlack(),),
        ),
        //-------------Nuruu Line-------------------

//Nuruu Right=====================================================================================================
//=====================================================================================================

//Nuruu Leftt=====================================================================================================
//=====================================================================================================
        //---------------------Hul Side-------------------------
        Positioned(
          top: 0,
          left: 90,
          child: Der(img: "$imgGol",),
        ),
        Positioned(
          top: 80,
          left: 80,
          child: NuruuGol(img: "$imgGol"),
        ),
        Positioned(
          top: 180,
          left: 80,
          child: DoodGol(img: "$imgGol"),
        ),
        //------------------------Suudal Side----------------------
        Positioned(
          top: 330,
          left: 80,
          child: SuudalGol(img: "$imgGol", width: 150,),
        ),
        Positioned(
          top: 365,
          left: 80,
          child: SuudalDood(img: "$imgGol"),
        ),

        Positioned(
          top: 388,
          left: 80,
          child: HulGol(img: "$imgGol"),
        ),
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

//Nuruu Leftt=====================================================================================================
//=====================================================================================================



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
//Nuruu gol=====================================================================================================
//=====================================================================================================
        //---------------------Hul Side-------------------------
        Positioned(
          top: 100,
          left: seatWidth / 2 - 50,
          child: HoidNuruuGol(img: "$imgZah"),
        ),
        Positioned(
          top: 200,
          left: seatWidth / 2 - 50,
          child: HoidNuruuGol(img: "$imgZah"),
        ),
        Positioned(
          top: 330,
          left: seatWidth / 2 - 50,
          height: 35,
          child: HoidNuruuGol(img: "$imgZah"),
        ),
        Positioned(
          top: 365,
          left: seatWidth / 2 - 50,
          height: 25,
          child: HoidNuruuGol(img: "$imgZah"),
        ),
        Positioned(
          top: 390,
          left: seatWidth / 2 - 50,
          height: 59,
          child: HoidNuruuGol(img: "$imgZah"),
        ),
//Nuruu gol=====================================================================================================
//=====================================================================================================


        Positioned(
          top: 30,
          right: 120,
          child: Image.asset("images/texture/$imgZuragDeed", width: 60, height: 40,),
        ),

        Positioned(
          top: 130,
          right: 110,
          child: Image.asset("images/texture/$imgZuragDood", width: 80, height: 50,),
        ),

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
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
import 'package:khaan_burees/screen/frag/Fbelen.dart';
import 'package:khaan_burees/screen/frag/Ftexture.dart';
import 'dart:async';
import 'dart:typed_data';
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
import 'package:khaan_burees/util/insertall.dart';
import 'package:khaan_burees/widget/WidgetMenu.dart';
import 'package:khaan_burees/widget/WidgetItemList.dart';
import 'package:khaan_burees/widget/TxtTotal.dart';
import 'package:khaan_burees/widget/BtnCar.dart';
import 'package:khaan_burees/widget/Sheets.dart';
import 'package:khaan_burees/util/front_seat.dart';
import 'package:khaan_burees/util/rear_seat.dart';
import 'package:khaan_burees/widget/BtnLoad.dart';
import 'package:khaan_burees/util/db.dart';

import 'Aadmin.dart';

class Amain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return main();
  }
}

class main extends State<Amain>{
  String page = "belen";
  List datas = new List();
  List data = new List();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, (){
      init();
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  init(){
    itemCount().then((too){
      print("_______$too");
      if(too < 1){
        insertAll().then((_){
          getItems().then((_datas){
            data = _datas;
            setState(() {

            });
            print("______1> $data");
          });

        });
      }else{
        getItems().then((_datas){
          data = _datas;
          setState(() {

          });
          print("______2> $data");
        });
      }
    }).catchError((err){
      print("________$err");
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      resizeToAvoidBottomInset: false,
//        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton.extended(
          label: Text(page == "belen" ? "Өөрөө зохиож үзэх" : "Бэлэн загвар харах"),
          onPressed: (){
            if(page == "belen")
              page = "texture";
            else
              page = "belen";
            setState(() {});
          },
          shape: RoundedRectangleBorder(
            side: BorderSide(color: cMat(), width: 1),
            borderRadius: BorderRadius.circular(40)
          ),
          splashColor: cBlue(),
          elevation: 3,
          backgroundColor: cMat(),
        ),
        body: SafeArea(
          child: page == "belen" ? Fbelen() : Ftexture(),
        )
    );
  }



}
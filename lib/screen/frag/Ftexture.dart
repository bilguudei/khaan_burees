import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;
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
import 'package:khaan_burees/widget/WidgetMenu.dart';
import 'package:khaan_burees/widget/WidgetItemList.dart';
import 'package:khaan_burees/widget/TxtTotal.dart';
import 'package:khaan_burees/widget/BtnCar.dart';
import 'package:khaan_burees/widget/Sheets.dart';
import 'package:khaan_burees/util/front_seat.dart';
import 'package:khaan_burees/util/rear_seat.dart';
import 'package:khaan_burees/widget/BtnLoad.dart';
import 'package:khaan_burees/util/db.dart';

import '../Aadmin.dart';

class Ftexture extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ftexture();
  }

}

class ftexture extends State<Ftexture>{

  int texture = 0;
  TextEditingController controller = new TextEditingController();

  bool selectCar = true;
  bool selectJeep = false;
  bool selectMiniBus = false;
  bool selectBus = false;

  bool nemelt = false;
  bool front = true;
  bool _menuVisible = false;

  double seatWidth = 300;
  double seatHeight = 450;
  List datas = new List();

  int total = 0;
  int priceOedol = 0;
  int priceGol = 0;
  int priceHajuu = 0;
  int priceZuragDeed = 0;
  int priceZuragDood = 0;
  int priceMaterial = 0;

  String imgGol = "";
  String imgZah = "";
  String imgZuragDeed = "";
  String imgZuragDood = "";
  String imgShirelt = "";
  String imgOruulga = "";

  String selected = "gol";

  @override
  void initState() {
    super.initState();
    init();

  }

  Future init() async{
    getItems().then((d){
      setState(() {
        datas = d;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color(0xffdadfe1),
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset("images/ic_logo.png", height: MediaQuery.of(context).size.height * 0.7, width: MediaQuery.of(context).size.width * 0.7, color: Color(0x10000000),),
          Positioned(
            left: -50,
            top: -50,
            child: GestureDetector(
              onLongPress: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Aadmin()));
              },
              child: Container(
                width: 240,
                height: 240,
                child: Center(child: Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Image.asset("images/ic_logo.png", width: 130, height: 130,),
                )),
                decoration: BoxDecoration(
                    color: Color(0xffbfbfbf),
                    borderRadius: BorderRadius.all(Radius.circular(600))
                ),

              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 80,
            child: Container(
              width: seatWidth + 240,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: cMat(), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(40))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Урд", style: TextStyle(color: cText(), fontWeight: front ? FontWeight.bold : FontWeight.w200,),),
                          ),
                          onTap: (){
                            setState(() {
                              front = true;
                            });
                          },
                        ),
                        Container(width: 1, height: 40, color: cMat(),),
                        GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Хойд", style: TextStyle(color: cText(), fontWeight: !front ? FontWeight.bold : FontWeight.w200),),
                          ),
                          onTap: (){
                            setState(() {
                              front = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: front ? FrontSeat(
                        imgGol: imgGol,
                        imgZah: imgZah,
                        imgZuragDeed: imgZuragDeed,
                        imgZuragDood: imgZuragDood,
                        seatHeight: seatHeight,
                        seatWidth: seatWidth
                    ) : RearSeat(
                        imgGol: imgGol,
                        imgZah: imgZah,
                        imgZuragDeed: imgZuragDeed,
                        imgZuragDood: imgZuragDood,
                        seatHeight: seatHeight,
                        seatWidth: seatWidth + 240
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: TxtTotal(total: "$total",),
                ),

                Row(
                  children: <Widget>[
                    BtnCar(onClick: (){
                      setState(() {
                        selectCar = true; selectJeep = false; selectMiniBus = false; selectBus = false;
                      });
                    },img: "ic_car_car.png", selected: selectCar, txt: "Жижиг тэрэг",),
                    BtnCar(onClick: (){
                      setState(() {
                        selectCar = false; selectJeep = true; selectMiniBus = false; selectBus = false;
                      });
                    },img: "ic_car_jeep.png", selected: selectJeep, txt: "Жийп",),
                    BtnCar(onClick: (){
                      setState(() {
                        selectCar = false; selectJeep = false; selectMiniBus = true; selectBus = false;
                      });
                    },img: "ic_car_minibus.png", selected: selectMiniBus, txt: "микро...",),
                    BtnCar(onClick: (){
                      setState(() {
                        selectCar = false; selectJeep = false; selectMiniBus = false; selectBus = true;
                      });
                    },img: "ic_car_bus.png", selected: selectBus, txt: "Автобус",)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 150),
                  child: Text("Нэмэлттэй эсэх"),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Switch(onChanged: (b){
                    setState(() {
                      nemelt = b;
                    });
                  },
                    value: nemelt,),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  transform: Matrix4.translationValues(8.0, 0.0, 0.0),
                  child: WidgetMenu(
                    img: imgGol,
                    une: toMoney("${priceGol}"),
                    text: "Гол",
                    selected: selected == "gol",
                    onClick: (){
                      setState(() {
                        selected = "gol";
                        _menuVisible = true;
                      });
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 600),
                  transform: Matrix4.translationValues(8.0, 0.0, 0.0),
                  child: WidgetMenu(
                    img: imgZah,
                    une: toMoney("${priceHajuu}"),
                    text: "Зах",
                    selected: selected == "zah",
                    onClick: (){
                      setState(() {
                        selected = "zah";
                        _menuVisible = true;
                      });
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 800),
                  transform: Matrix4.translationValues(8.0, 0.0, 0.0),
                  child: WidgetMenu(
                    img: imgZuragDeed,
                    text: "Дэрний лого",
                    une: toMoney("${priceZuragDeed}"),
                    selected: selected == "logoDeed",
                    onClick: (){
                      setState(() {
                        selected = "logoDeed";
                        _menuVisible = true;
                      });
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1000),
                  transform: Matrix4.translationValues(8.0, 0.0, 0.0),
                  child: WidgetMenu(
                    img: imgZuragDood,
                    une: toMoney("${priceZuragDood}"),
                    text: "Суудлын лого",
                    selected: selected == "logoDood",
                    onClick: (){
                      setState(() {
                        selected = "logoDood";
                        _menuVisible = true;
                      });
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1200),
                  transform: Matrix4.translationValues(8.0, 0.0, 0.0),
                  child: WidgetMenu(
                    img: imgShirelt,
                    text: "Ширэлт",
                    une: toMoney("${priceOedol}"),
                    selected: selected == "shirelt",
                    onClick: (){
                      setState(() {
                        selected = "shirelt";
                        _menuVisible = true;
                      });
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 1400),
                  transform: Matrix4.translationValues(8.0, 0.0, 0.0),
                  child: WidgetMenu(
                    img: imgOruulga,
                    text: "Оруулга",
                    une: toMoney("${priceMaterial}"),
                    selected: selected == "oruulga",
                    onClick: (){
                      setState(() {
                        selected = "oruulga";
                        _menuVisible = true;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              transform: _menuVisible ? Matrix4.translationValues(0.0, 0.0, 0.0) : Matrix4.translationValues(0.0, 500.0, 0.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                          top: BorderSide(width: 5, color: Colors.lightBlue.shade700)
                      )
                  ),
                  child: ListView.builder(
                    itemBuilder: (c,i){
                      return WidgetItemList(
                        img: datas[i]["img"],
                        price: datas[i]["material"],
                        onClick: (){
                          print("______ ${datas[i]}");
                          switch(selected){
                            case "gol": imgGol = datas[i]["img"];priceGol = datas[i]["${carType()}Main${carPlus()}"];break;
                            case "zah": imgZah = datas[i]["img"];priceHajuu = datas[i]["${carType()}Side${carPlus()}"];break;
                            case "logoDeed": imgZuragDeed = datas[i]["img"];break;
                            case "logoDood": imgZuragDood = datas[i]["img"];break;
                            case "shirelt": break;
                            case "oruulga": break;
                          }
                          _menuVisible = false;
                          setState(() {});
                        },
                      );
                    },
                    physics: BouncingScrollPhysics(),
                    itemCount: datas.length,
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    addAutomaticKeepAlives: false,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  String toMoney(String str){
    int oron = 0;
    String money = "";
    if(str.length > 0){
      for(int i = str.length; i >= 1; i--){
        oron++;
        money = str.substring(i - 1, i) + money;
        if(oron == 3){
          if(i > 1){
            money = "," + money;
            oron = 0;
          }
        }
      }
    }else{
      money = "0";
    }

    money += "₮";
    return money;
  }

  String carType(){
    String str = "priceCar";
    if(selectCar) str = "priceCar";
    if(selectJeep) str = "priceJeep";
    if(selectMiniBus) str = "priceMicro";
    if(selectBus) str = "priceBus";
    return str;
  }

  String carPlus(){
    if(nemelt) return "Plus";
    else return "";
  }

}
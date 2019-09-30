import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';
import 'package:khaan_burees/util/db.dart';
import 'package:khaan_burees/widget/BtnLoad.dart';
import 'package:khaan_burees/widget/InputTxtBorder.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:khaan_burees/widget/SheetEdit.dart';
import 'package:khaan_burees/widget/WidgetPrice.dart';

import 'Aadmin.dart';

class Aedit extends StatefulWidget{

  Map d;
  Aedit(this.d);

  @override
  State<StatefulWidget> createState() {
    return edit();
  }

}

class edit extends State<Aedit>{
  Map data = {};

  bool loading = false;
  bool active = true;
  bool showTab = false;
  bool loadQuery = false;
  int tabIndex;
  String uneSolih = "";

  String s1 = "";
  String s2 = "";
  String s3 = "";
  String s4 = "";

  String s5 = "";
  String s6 = "";
  String s7 = "";
  String s8 = "";

  String s9 = "";
  String s10 = "";
  String s11 = "";
  String s12 = "";

  String s13 = "";
  String s14 = "";
  String s15 = "";
  String s16 = "";

  @override
  void initState() {
    super.initState();
    data = widget.d;
    print("___________>>>$data");
    if(data["active"] == 1)
      active = true;
    else active = false;

    s1 = "${data["priceCarMain"]}";
    s2 = "${data["priceCarSide"]}";
    s3 = "${data["priceCarMainPlus"]}";
    s4 = "${data["priceCarSidePlus"]}";

    s5 = "${data["priceJeepMain"]}";
    s6 = "${data["priceJeepSide"]}";
    s7 = "${data["priceJeepMainPlus"]}";
    s8 = "${data["priceJeepSidePlus"]}";

    s9 = "${data["priceMicroMain"]}";
    s10 = "${data["priceMicroSide"]}";
    s11 = "${data["priceMicroMainPlus"]}";
    s12 = "${data["priceMicroSidePlus"]}";

    s13 = "${data["priceBusMain"]}";
    s14 = "${data["priceBusSide"]}";
    s15 = "${data["priceBusMainPlus"]}";
    s16 = "${data["priceBusSidePlus"]}";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Aadmin()));
      },
      child: Scaffold(
        backgroundColor: cDefaultGrey1(),
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Aadmin())),
          ),
          backgroundColor: cBlue(),
          elevation: 3,
          title: Text("Материалын үнэ, тохиргоо"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Hero(
                  tag: "${data["img"]}",
                  child: CircleAvatar(
//              child: Image.asset("images/${item["img"]}", width: 300, height: 300,),
                    backgroundImage: AssetImage("images/${data["img"]}"),
                    radius: 75,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Материал бэлэн байгаа эсэх"),
                    Switch(onChanged: (b){
                      setState(() {
                        active = b;
                      });
                    },
                      value: active,),
                  ],
                )
              ),
            ),
            Positioned(
              top: 220,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Table(
                  defaultColumnWidth: FractionColumnWidth(.2),
                  children: [
                    TableRow(
                      children: [
                        WidgetPrice(
                          onClick: (){
                            setState(() {
                              tabIndex = 0;
                              showTab = true;
                              uneSolih = "$s1";
                            });
                          },
                          name: "Жижиг тэрэг-гол",
                          price: toMoney("$s1"),
                        ),
                        WidgetPrice(
                          onClick: (){
                            setState(() {
                              tabIndex = 1;
                              showTab = true;
                              uneSolih = "${s2}";
                            });
                          },
                          name: "Жижиг тэрэг-зах",
                          price: toMoney("${s2}"),
                        ),
                        WidgetPrice(
                          onClick: (){
                            setState(() {
                              tabIndex = 2;
                              showTab = true;
                              uneSolih = "$s3";
                            });
                          },
                          name: "Жижиг тэрэг-гол(Нэмэлттэй)",
                          price: toMoney("${s3}"),
                        ),
                        WidgetPrice(
                          onClick: (){
                            setState(() {
                              tabIndex = 3;
                              showTab = true;
                              uneSolih = "$s4";
                            });
                          },
                          name: "Жижиг тэрэг-зах(Нэмэлттэй)",
                          price: toMoney("$s4"),
                        ),
                      ]
                    ),
                    TableRow(
                        children: [
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 4;
                                showTab = true;
                                uneSolih = "$s5";
                              });
                            },
                            name: "Жийп-гол",
                            price: toMoney("$s5"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 5;
                                showTab = true;
                                uneSolih = "$s6";
                              });
                            },
                            name: "Жийп-зах",
                            price: toMoney("$s6"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 6;
                                showTab = true;
                                uneSolih = "$s7";
                              });
                            },
                            name: "Жийп-гол(Нэмэлттэй)",
                            price: toMoney("$s7"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 7;
                                showTab = true;
                                uneSolih = "$s8";
                              });
                            },
                            name: "Жийп-зах(Нэмэлттэй)",
                            price: toMoney("$s8"),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 8;
                                showTab = true;
                                uneSolih = "$s9";
                              });
                            },
                            name: "Микро-гол",
                            price: toMoney("$s9"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 9;
                                showTab = true;
                                uneSolih = "$s10";
                              });
                            },
                            name: "Микро-зах",
                            price: toMoney("$s10"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 10;
                                showTab = true;
                                uneSolih = "$s11";
                              });
                            },
                            name: "Микро-гол(Нэмэлттэй)",
                            price: toMoney("$s11"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 11;
                                showTab = true;
                                uneSolih = "$s12";
                              });
                            },
                            name: "Микро-зах(Нэмэлттэй)",
                            price: toMoney("$s12"),
                          ),
                        ]
                    ),
                    TableRow(
                        children: [
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 12;
                                showTab = true;
                                uneSolih = "$s13";
                              });
                            },
                            name: "Автобус-гол",
                            price: toMoney("$s13"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 13;
                                showTab = true;
                                uneSolih = "$s14";
                              });
                            },
                            name: "Автобус-зах",
                            price: toMoney("$s14"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 14;
                                showTab = true;
                                uneSolih = "$s15";
                              });
                            },
                            name: "Автобус-гол(Нэмэлттэй)",
                            price: toMoney("$s15"),
                          ),
                          WidgetPrice(
                            onClick: (){
                              setState(() {
                                tabIndex = 15;
                                showTab = true;
                                uneSolih = "$s16";
                              });
                            },
                            name: "Автобус-зах(Нэмэлттэй)",
                            price: toMoney("$s16"),
                          ),
                        ]
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: BtnLoad(
                  textColor: Colors.white,
                  borderColor: cBlue(),
                  width: 200,
                  color: cBlue(),
                  text: "Буцах",
                  splash: cActive(),
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Aadmin()));
                  },
                  loading: loading,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width / 2,
              left: MediaQuery.of(context).size.width / 4,
              child: AnimatedContainer(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: cBlue(), width: 1)
                ),
                duration: Duration(milliseconds: 600),
                transform: showTab ? Matrix4.translationValues(0.0, 20.0, 0.0) : Matrix4.translationValues(0.0, 800.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: (){
                        showTab = false;
                        loadQuery = false;
                        setState(() {});
                      },
                      iconSize: 30,
                      alignment: Alignment.topRight,
                    ),
                    Center(child: Text("${indexToHint()}")),
                    Center(child: Text(toMoney("${uneSolih}"), style: TextStyle(color: cText(), fontSize: 30),)),

                    SheetEdit(
                      onClick: (str){
                        print("___________${tabIndex}_>>$str");
                        if(str == "<"){
                          uneSolih = uneSolih.substring(0, uneSolih.length - 1);
                        }else{
                          uneSolih += str;
                        }
                        setState(() {});
                      },
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BtnLoad(
                            color: cActive(),
                            width: 200,
                            onPressed: (){
                              showTab = false;
                              loadQuery = false;
                              setState(() {});
                            },
                            loading: false,
                            splash: cMat(),
                            text: "Болих",
                            borderColor: cActive(),
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          BtnLoad(
                            color: cBlue(),
                            width: 200,
                            onPressed: (){
                              print("______${indexToField()} == $uneSolih");
                              if(!loadQuery){
                                loadQuery = true;
                                updateField(indexToField(), int.parse(uneSolih), data["id"]).then((res){
                                  print("_____>>query_result>>_$res");
                                  loadQuery = false;
                                  showTab = false;
                                  print("__________uneSolih___$uneSolih && tabIndex >> $tabIndex");
                                  switch(tabIndex){
                                    case 0: s1 = uneSolih;break;case 1: s2 = uneSolih;break;
                                    case 2: s3 = uneSolih;break;case 3: s4 = uneSolih;break;
                                    case 4: s5 = uneSolih;break;case 5: s6 = uneSolih;break;
                                    case 6: s7 = uneSolih;break;case 7: s8 = uneSolih;break;
                                    case 8: s9 = uneSolih;break;case 9: s10 = uneSolih;break;
                                    case 10: s11 = uneSolih;break;case 11: s12 = uneSolih;break;
                                    case 12: s13 = uneSolih;break;case 13: s14 = uneSolih;break;
                                    case 14: s15 = uneSolih;break;case 15: s16 = uneSolih;break;
                                  }
                                  setState(() {});
                                });
                              }
                            },
                            loading: loadQuery,
                            splash: cActive(),
                            text: "Өөрчлөх",
                            borderColor: cBlue(),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,)
                  ],
                ),
              ),
            )
          ],
        ),
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

  String indexToField(){
    switch(tabIndex){
      case 0: return "priceCarMain";
      case 1: return "priceCarSide";
      case 2: return "priceCarMainPlus";
      case 3: return "priceCarSidePlus";

      case 4: return "priceJeepMain";
      case 5: return "priceJeepSide";
      case 6: return "priceJeepMainPlus";
      case 7: return "priceJeepSidePlus";

      case 8: return "priceMicroMain";
      case 9: return "priceMicroSide";
      case 10: return "priceMicroMainPlus";
      case 11: return "priceMicroSidePlus";

      case 12: return "priceBusMain";
      case 13: return "priceBusSide";
      case 14: return "priceBusMainPlus";
      case 15: return "priceBusSidePlus";

    }
  }

  String indexToHint(){
    switch(tabIndex){
      case 0: return "Жижиг тэрэг-гол";
      case 1: return "Жижиг тэрэг-зах";
      case 2: return "Жижиг тэрэг-гол(Нэмэлттэй)";
      case 3: return "Жижиг тэрэг-зах(Нэмэлттэй)";

      case 4: return "Жийп-гол";
      case 5: return "Жийп-зах";
      case 6: return "Жийп-гол(Нэмэлттэй)";
      case 7: return "Жийп-зах(Нэмэлттэй)";

      case 8: return "Микро-гол";
      case 9: return "Микро-зах";
      case 10: return "Микро-гол(Нэмэлттэй)";
      case 11: return "Микро-зах(Нэмэлттэй)";

      case 12: return "Автобус-гол";
      case 13: return "Автобус-зах";
      case 14: return "Автобус-гол(Нэмэлттэй)";
      case 15: return "Автобус-зах(Нэмэлттэй)";

    }
  }

}
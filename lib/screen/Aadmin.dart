import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khaan_burees/util/ColorSeat.dart';
import 'package:khaan_burees/util/db.dart';
import 'package:khaan_burees/util/insertall.dart';
import 'package:khaan_burees/widget/WidgetItem.dart';

import 'Aedit.dart';
import 'Amain.dart';

class Aadmin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return admin();
  }

}

class admin extends State<Aadmin>{

  bool stat = false;
  List data = new List();

//  DB db;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, (){
      init();
    });

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
    return WillPopScope(
      onWillPop: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Amain()));
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Amain()))
          ),
          backgroundColor: cBlue(),
          elevation: 3,
          title: Text("Материалууд"),
        ),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset("images/ic_logo.png", height: MediaQuery.of(context).size.height * 0.7, width: MediaQuery.of(context).size.width * 0.7, color: Color(0x10000000),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: data.length > 0 ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 20,
                  childAspectRatio: 1.5
                ),
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                shrinkWrap: false,
                itemBuilder: (c,i){
                  print("________build>>>${data[i]}");
                  return WidgetItem(
                    item: data[i],
                    onClick: (){
                      print("_________${data[i]}");
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Aedit(data[i])));
                    },
                  );
                }
              ) : Container(),
            )
//          Positioned(
//            top: 70,
//            child: Container(
//              width: 250,
//              decoration: BoxDecoration(
//                  color: Colors.white,
//                  border: Border.all(color: cMat(), width: 2),
//                  borderRadius: BorderRadius.all(Radius.circular(40))
//              ),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisSize: MainAxisSize.max,
//                children: <Widget>[
//                  GestureDetector(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text("Материал", style: TextStyle(color: cText(), fontWeight: !stat ? FontWeight.bold : FontWeight.w200,),),
//                    ),
//                    onTap: (){
//                      setState(() {
//                        stat = false;
//                        init();
//                      });
//                    },
//                  ),
//                  Container(width: 1, height: 40, color: cMat(),),
//                  GestureDetector(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text("Статистик", style: TextStyle(color: cText(), fontWeight: stat ? FontWeight.bold : FontWeight.w200),),
//                    ),
//                    onTap: (){
//                      setState(() {
//                        stat = true;
//                      });
//                    },
//                  ),
//                ],
//              ),
//            ),
//          )
          ],
        ),
      ),
    );
  }

}
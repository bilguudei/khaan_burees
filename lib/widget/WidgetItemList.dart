import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';
import 'package:khaan_burees/widget/BtnLoad.dart';
import 'dart:async';

class WidgetItemList extends StatefulWidget{
  Function onClick;
  String img;
  String price;

  WidgetItemList({this.onClick, this.img, this.price});

  @override
  State<StatefulWidget> createState() {
    return widgetItemList();
  }
}

class widgetItemList extends State<WidgetItemList>{

  bool showBtn;
  Timer timer;


  @override
  void initState() {
    super.initState();
    showBtn = false;
  }

  @override
  void dispose() {
//    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.img.length > 0 ? GestureDetector(
      onTap: showButton,
      child: SizedBox(
          width: 120,
          height: 150,
          child: Stack(
            children: <Widget>[
              Container(
                width: 120,
                height: 150,
                child: Image.asset("images/texture/${widget.img}", width: 120, height: 150, fit: BoxFit.cover,),
              ),
              Positioned(
                top: 0,
                width: 120,
                child: Container(
                  color: Color(0x90ffffff),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4, top: 10, bottom: 10),
                    child: Text("${widget.price}"),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: AnimatedContainer(
                  child: BtnLoad(
                    text: "Сонгох",
                    color: Colors.white,
                    width: 100,
                    splash: cActive(),
                    onPressed: widget.onClick,
                    borderColor: cDefaultGrey3(),
                    textColor: cText(),
                    loading: false,
                  ),
                  duration: Duration(milliseconds: 400),
                  transform: showBtn ? Matrix4.translationValues(0.0, 0.0, 0.0) : Matrix4.translationValues(0.0, 200.0, 0.0),
                ),

              )
            ],
            alignment: Alignment.center,
          )
      ),
    ) : Container();
  }

  showButton(){
    setState(() {
      showBtn = true;
    });

    timer = new Timer(Duration(seconds: 2), (){
      setState(() {
        showBtn = false;
      });
    });


  }

}
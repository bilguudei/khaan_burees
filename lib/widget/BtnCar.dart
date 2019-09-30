import 'package:flutter/material.dart';

class BtnCar extends StatefulWidget{

  String img;
  String txt;
  bool selected;
  Function onClick;


  BtnCar({this.img, this.txt, this.selected, this.onClick});

  @override
  State<StatefulWidget> createState() {
    return btnCar();
  }

}

class btnCar extends State<BtnCar>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          child: Column(
            children: <Widget>[
              Image.asset("images/${widget.img}", width: 40, height: 40, color: widget.selected ? Color(0xff000000) : Color(0xffbcbcbc),),
              SizedBox(height: 5,),
              Text("${widget.txt}"),
              SizedBox(height: 5,)
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: widget.selected ? Colors.white : Color(0x10ededed),
            border: Border.all(color: Colors.grey, width: 1)
          ),
        ),
      ),
    );
  }

}
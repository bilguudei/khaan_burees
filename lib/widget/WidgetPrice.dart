import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class WidgetPrice extends StatelessWidget{
  String name;
  String price;
  Function onClick;

  WidgetPrice({this.name, this.price, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onClick,
        child: Material(
          color: Colors.white,
          elevation: 3,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 3),
                  child: Text(name, style: TextStyle(color: cText(), fontSize: 14),),
                ),
                Center(child: Text(price, style: TextStyle(color: cText(), fontSize: 30),)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
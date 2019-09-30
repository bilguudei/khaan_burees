import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class SheetEdit extends StatefulWidget{
  Function onClick;
  int index;

  SheetEdit({this.onClick, this.index});

  @override
  State<StatefulWidget> createState() {
    return sheetEdit();
  }

}

class sheetEdit extends State<SheetEdit>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 50),
      child: Table(
        children: [
          TableRow(
            children: [
              MaterialButton(
                splashColor: cBlue(),
                onPressed: (){
                  widget.onClick("1");
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("1", style: TextStyle(color: cText(), fontSize: 20),),
                ),
              ),
              MaterialButton(
                splashColor: cBlue(),
                onPressed: (){
                  widget.onClick("2");
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("2", style: TextStyle(color: cText(), fontSize: 20),),
                ),
              ),
              MaterialButton(
                splashColor: cBlue(),
                onPressed: (){
                  widget.onClick("3");
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("3", style: TextStyle(color: cText(), fontSize: 20),),
                ),
              ),
            ]
          ),
          TableRow(
              children: [
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("4");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("4", style: TextStyle(color: cText(), fontSize: 20),),
                  ),
                ),
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("5");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("5", style: TextStyle(color: cText(), fontSize: 20),),
                  ),
                ),
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("6");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("6", style: TextStyle(color: cText(), fontSize: 20),),
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("7");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("7", style: TextStyle(color: cText(), fontSize: 20),),
                  ),
                ),
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("8");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("8", style: TextStyle(color: cText(), fontSize: 20),),
                  ),
                ),
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("9");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("9", style: TextStyle(color: cText(), fontSize: 20),),
                  ),
                ),
              ]
          ),
          TableRow(
              children: [
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("000");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("000", style: TextStyle(color: cText(), fontSize: 20),),
                  ),
                ),
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("0");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("0", style: TextStyle(color: cText(), fontSize: 20),),
                  ),
                ),
                MaterialButton(
                  splashColor: cBlue(),
                  onPressed: (){
                    widget.onClick("<");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Icon(Icons.backspace),
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }

}
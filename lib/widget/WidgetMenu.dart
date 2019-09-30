import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';
import 'package:khaan_burees/widget/WidgetBlinkingText.dart';

class WidgetMenu extends StatefulWidget{
  bool selected;
  String text;
  String img;
  String une;
  Function onClick;

  WidgetMenu({this.selected, this.text, this.img, this.onClick, this.une});

  @override
  State<StatefulWidget> createState() {
    return widgetMenu();
  }

}

class widgetMenu extends State<WidgetMenu>{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
        child: SizedBox(
          width: 400,
          height: 60,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
              border: Border.all(color: widget.selected ? cActive() : cText(), width: 3)
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[

                Positioned(
                  left: 0,
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: WidgetBlinkingText(text: widget.text, blink: widget.selected,),
                  ),
                ),
                Positioned(
                  left: 150,
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        border: Border.all(color: widget.selected ? cActive() : cText(), width: 3)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left : 0),
                      child: Center(
                        child: Container(
                          width: 160,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              child: Image.asset("images/texture/${widget.img}", fit: BoxFit.fill,)
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
                        border: Border.all(color: widget.selected ? cActive() : cText(), width: 3)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left : 28.0, right: 50),
                      child: Center(
                        child: Text("Үнэ: ${widget.une}", style: TextStyle(color: cText(), fontSize: 16),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
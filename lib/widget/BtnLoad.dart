import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BtnLoad extends StatefulWidget{

  Color splash = Color(0xff624594);
  Color color = Colors.white;
  Color textColor = Color(0xffd6b9e1);
  Color borderColor = Color(0xffa971bc);
  double width;
  bool loading;

  final GestureTapCallback onPressed;
  String text = "text";


  BtnLoad({this.splash, this.color, this.textColor, this.borderColor,
    this.onPressed, this.text, this.width, this.loading});

  @override
  State<StatefulWidget> createState() {
    return btn();
  }

}

class btn extends State<BtnLoad>{
  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    return Center(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: widget.loading ? 50 : widget.width,//MediaQuery.of(context).size.width * 0.85,
        height: 50,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: widget.loading ? BorderRadius.circular(50.0) : BorderRadius.circular(50.0),
          ),
          elevation: isPressed ? 0.0 : 5.0,
          shadowColor: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: widget.loading ? BorderRadius.circular(50.0) : BorderRadius.circular(50.0),
              shape: BoxShape.rectangle,
              border: Border.all(color: widget.borderColor, width: 2.0),
            ),
            child: Material(
              type: MaterialType.transparency,
              color: Colors.transparent,
              child: InkWell(
                splashColor: widget.splash,
                onTap: (){
                  widget.onPressed();
                },
                borderRadius: widget.loading ? BorderRadius.circular(50.0) : BorderRadius.circular(50.0),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: AnimatedCrossFade(
                      firstChild: Text(
                        widget.text,
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: 16,
                        ),
                      ),
                      secondChild: SpinKitRing(duration: Duration(milliseconds: 2500), color: widget.textColor, size: 35, lineWidth: 2,),
                      crossFadeState: widget.loading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 400),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
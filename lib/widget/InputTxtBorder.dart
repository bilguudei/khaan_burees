import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class InputTxtBorder extends StatefulWidget{
  String hint;
  bool filled;
  TextInputType inputType = TextInputType.text;
  bool isPassword = false;
  TextInputAction action = TextInputAction.next;
  TextEditingController controller;
  Function onChange;
  double width;
  Color background;
  Color borderColor;
  Color textColor;
  Color hintColor;
  double textSize;
  TextCapitalization textCapitalization;

  InputTxtBorder({this.hint, this.inputType,
    this.isPassword, this.action, this.controller,
    this.onChange, this.width, this.borderColor, this.background, this.textColor, this.hintColor, this.textSize, this.textCapitalization, this.filled});

  @override
  State<StatefulWidget> createState() {
    return inputTxtBorder();
  }

}

class inputTxtBorder extends State<InputTxtBorder>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width != null ? widget.width : MediaQuery.of(context).size.width * 0.85,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          controller: widget.controller,
          onChanged: (str){
            widget.onChange(str);
          },
          textAlign: TextAlign.start,
          cursorColor: widget.textColor,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: widget.borderColor != null ? widget.borderColor : cMat(), width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: widget.borderColor != null ? widget.borderColor : cMat(), width: 1),
            ),
            fillColor: widget.background != null ? widget.background : Colors.white,
            labelStyle: TextStyle(color: widget.hintColor != null ? widget.hintColor : cDefaultGrey2()),
            filled: widget.filled != null ? widget.filled : true,
            labelText: widget.hint != null ? widget.hint : "",
          ),
          style: TextStyle(color: widget.textColor != null ? widget.textColor : Colors.white, fontSize: widget.textSize != null ? widget.textSize : 22),
          textInputAction: widget.action,
          keyboardType: widget.inputType,
          textCapitalization: widget.textCapitalization != null ? widget.textCapitalization : TextCapitalization.none,
          obscureText: widget.isPassword,
        ),
      ),
    );
  }

}
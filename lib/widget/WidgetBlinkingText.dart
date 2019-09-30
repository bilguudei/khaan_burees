import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class WidgetBlinkingText extends StatefulWidget{

  String text;
  bool blink;


  WidgetBlinkingText({this.text, this.blink});

  @override
  State<StatefulWidget> createState() {
    return blinkingText();
  }

}

class blinkingText extends State<WidgetBlinkingText> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation = Tween(begin: 1.0, end: 0.1).animate(curve);
    animation.addStatusListener((status){
      if(status == AnimationStatus.completed)
        controller.reverse();
      else if(status == AnimationStatus.dismissed)
        controller.forward();
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: widget.blink ? FadeTransition(
          opacity: animation,
          child: Text(widget.text, style: TextStyle(color: cText(), fontSize: 18, fontWeight: FontWeight.bold),),
        ) : Text(widget.text, style: TextStyle(color: cText(), fontSize: 18, fontWeight: FontWeight.bold),),
      ),
    );
  }

}
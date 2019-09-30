import 'package:flutter/material.dart';

class F_belen_full extends StatefulWidget{
  String hero;
  String img1;
  String img2;
  F_belen_full(this.hero, this.img1, this.img2);

  @override
  State<StatefulWidget> createState() {
    return f_belen_full();
  }

}

class f_belen_full extends State<F_belen_full>{

  @override
  void initState() {
    super.initState();
    print("_______${widget.img1}");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: <Widget>[
            Expanded(child: Hero(tag: widget.hero, child: Image.asset("images/belen_zurag/${widget.img1}.jpg", fit: BoxFit.cover, height: MediaQuery.of(context).size.height, width: 300,))),
            Expanded(child: Image.asset("images/belen_zurag/${widget.img2}.jpg", fit: BoxFit.cover, height: MediaQuery.of(context).size.height, width: 300,)),
//            Image.asset("images/belen_zurag/${widget.img2}.jpg", fit: BoxFit.cover, height: 300, width: 300,),
          ],
        ),
      ),
    );
  }

}
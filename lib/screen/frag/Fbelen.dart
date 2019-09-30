import 'package:flutter/material.dart';
import 'package:khaan_burees/screen/frag/F_belen_full.dart';

class Fbelen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return fbelen();
  }

}

class fbelen extends State<Fbelen>{

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
//        childAspectRatio: 180/130
      ),
      itemBuilder: (c,i){
        return nud(hero: "img$i", img1: "${i + 1}f", img2: "${i + 1}r");
      },
      itemCount: 57,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }

  Widget nud({String img1, String img2, String hero, Function onClick}){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (c) => F_belen_full(hero, img1, img2)));
      },
      child: Hero(
        tag: hero,
        child: Image.asset("images/belen_zurag/$img1.jpg", fit: BoxFit.cover,)
      ),
    );
  }

}
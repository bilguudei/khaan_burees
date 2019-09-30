import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';

class WidgetItem extends StatelessWidget{

  Map item;
  Function onClick;
  WidgetItem({this.item, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 20,
        child: Stack(
          alignment: Alignment.centerRight,
          children: <Widget>[


            Positioned(
              left: 70,
              child: GestureDetector(
                onTap: onClick,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        border: Border.all(color: item["active"] == 1 ? cGreen() : cActive(), width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only( left: 48.0, top: 15, bottom: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          Text("Төлөв: ${item["active"] == 1 ? "Бэлэн": "Дууссан"}",),
                          SizedBox(height: 10,),
//                        Text("Жиипний үнэ: ${item["priceCarMain"]}",),
//                        SizedBox(height: 10,),
//                        Text("Микроны үнэ: ${item["priceCarMain"]}",),
//                        SizedBox(height: 10,),
//                        Text("Автобусны үнэ: ${item["priceCarMain"]}",),
//                        SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Hero(
                tag: "${item["img"]}",
                child: CircleAvatar(
//              child: Image.asset("images/${item["img"]}", width: 300, height: 300,),
                  backgroundImage: AssetImage("images/${item["img"]}"),
                  radius: 55,
                ),
              ),
            ),
          ]
        )
      ),
    );
  }

}
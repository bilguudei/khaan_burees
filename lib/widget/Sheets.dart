import 'package:flutter/material.dart';
import 'package:khaan_burees/util/ColorSeat.dart';
import 'package:khaan_burees/widget/BtnLoad.dart';
import 'package:khaan_burees/widget/InputTxtBorder.dart';
import 'package:khaan_burees/screen/Aadmin.dart';

sheetAdminPass({BuildContext context, TextEditingController controller}){
  showModalBottomSheet(context: context, builder: (c){
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        color: cMat(),
      ),
      child: Padding(padding: EdgeInsets.all(18), child: Column(
        children: <Widget>[
          SizedBox(height: 8,),
          InputTxtBorder(
            width: MediaQuery.of(context).size.width * 0.4,
            filled: false,
            isPassword: true,
            textSize: 16,
            borderColor: Colors.white,
            textColor: cText(),
            inputType: TextInputType.text,
            action: TextInputAction.done,
            background: Color(0x00ffffff),
            hint: "Нэвтрэх нууц үг",
            hintColor: cDefaultGrey1(),
            controller: controller,
            textCapitalization: TextCapitalization.none,
          ),
          SizedBox(height: 8,),
          BtnLoad(
            textColor: cDefaultBlack(),
            borderColor: cBlue(),
            width: MediaQuery.of(context).size.width * 0.4,
            color: cBlue(),
            text: "Нэвтрэх",
            splash: cActive(),
            onPressed: (){

              if(controller.text.toLowerCase() == "kingseat"){
                Navigator.pop(context);
                controller.text = "";
                Navigator.push(context, MaterialPageRoute(builder: (c) => Aadmin()));
              }else{
                sheetWarning(context, "Та нууц үгээ зөв оруулна уу");
              }
            },
            loading: false,
          ),
          SizedBox(height: 8,),
        ],
      ),),
    );
  });
}

void sheetWarning(BuildContext context, String msg){
  showModalBottomSheet(
      context: context,
      builder: (c){
        return Container(
            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)),
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30, right: 12, left: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.warning, color: Color(0xfff7ca18), size: 50,),
                    SizedBox(height: 15,),
                    Text(msg, style: TextStyle(color: cText(), fontSize: 18),textAlign: TextAlign.center, maxLines: 10,),
                  ],
                ),
              ),
            )
        );
      }
  );
}

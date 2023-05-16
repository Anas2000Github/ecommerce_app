import 'package:flutter/material.dart';
import 'package:get/get.dart';



class CustomText extends StatelessWidget{

 final String? text;
 final double? fontsize;
 Color? color =Get.isDarkMode? Colors.white:Colors.black;
 final Alignment? alignment;
 final FontWeight? fontWeight;
 final int? maxLines;
 final  double? height;
  double? wordSpacing;

 CustomText( {
   this.text='',
   this.fontsize=16,
   this.color,
   this.alignment=Alignment.topLeft,
   this.fontWeight= FontWeight.normal,
   this.maxLines = 10000,
   this.height= 1.3,
   this.wordSpacing,});


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child:  Text(
        text.toString(),
        maxLines: maxLines,
        style: TextStyle(
          overflow: TextOverflow.fade,
          wordSpacing: wordSpacing,
          height: height,
          fontSize: fontsize,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
  }



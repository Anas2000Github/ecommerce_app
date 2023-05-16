import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text.dart';


class CustomButtonSocialMedia {

  static Container
  buttonStyle(
      {
        String? text,
        String? imageUrl,
        Function()? onPressed,

      })
  {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[100],
        border: Border.all(width: 2,color: Colors.grey),
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(18),
        onPressed:onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(imageUrl!),
            SizedBox(width: Get.width*.1,),
            CustomText(text: text,
              fontsize: 14,)
          ],),
      ),
    );
  }
}

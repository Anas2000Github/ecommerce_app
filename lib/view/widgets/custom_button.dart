import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custom_text.dart';



class CustomButton {

  static MaterialButton
  buttonStyle(
      {
        String? text,
        Color? colorButton = Constants.primaryColor,
        Function()? onPressed,
        double? borderSize = 8,
        double? paddingVertical = 18,
        double? paddingHorizontal = 18,
        Color? colorText= Colors.white
      })
  {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderSize!)),
      padding: EdgeInsets.symmetric(vertical: paddingVertical!, horizontal: paddingHorizontal!),
      onPressed: onPressed,
      color: colorButton,
      child: CustomText(
        text: text,
        alignment: Alignment.center,
        fontsize: 18,
        color: colorText,
      ),
    );
  }
}


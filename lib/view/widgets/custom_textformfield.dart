import 'package:flutter/material.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';


class CustomTextFormField {
  static Padding
  textFieldStyle(
      {String labelText = "",
        String hintText = "",
        String text = "",
        double fontSize= 15,
        FontWeight fontWeight =FontWeight.w300,
        Color? textColor,
        Color? hintColor,
        InputBorder? border,
        required Null Function(dynamic value) onSaved,
        required String? Function(dynamic value) validator})
  {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23,vertical: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
               text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight:fontWeight ,
              ),
            ),
          ),
          TextFormField(
            onSaved: onSaved,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: hintColor,fontSize: 17),
              border: border,
            ),

          ),
        ],
      ),
    );
  }
}

// class CustomTextFiled{
//   static Padding
//   textFieldStyle(
//       {String labelText = "",
//         String hintText = "",
//         String text = "",
//         String prefixText='',
//         double fontSize= 15,
//         FontWeight fontWeight =FontWeight.w300,
//         Color? textColor,
//         Color? hintColor,
//     })
//   {
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 23,vertical: 15),
//       child: TextField(
//         decoration: InputDecoration(
//           prefixText: prefixText,
//           hintText: hintText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10)
//           ),
//           hintStyle: TextStyle(color: hintColor,fontSize: 17),
//         ),
//
//       ),
//     );
//   }
// }

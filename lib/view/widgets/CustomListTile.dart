import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/helper/theme_controller.dart';
import 'custom_text.dart';

class CustomListTile {

  static Container
  listTileStyle(
      {
        String? text,
        String? imageUrl,
        Function()? onPressed,

})
  {
    return Container(
      child: ListTile(
        onTap: onPressed,
        title: CustomText(
          text: text,
        ),
        leading: Image.asset(
            imageUrl.toString()),
        trailing: Icon(
          Icons.navigate_next,
          color: Colors.black,
        ),
      ),
    );
  }
}

class addRadioButton {

  static RadioListTile
  addRadio(
      {required ThemeMode val,
        required String title,
        required IconData icon,
        required BuildContext context,
        required dynamic groupValue,
        required void Function(dynamic)? onChanged})
  {
    return RadioListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(icon),
          ],),
        value: val,
        activeColor: Theme.of(context).primaryColor,
        groupValue:groupValue ,
        onChanged: onChanged,
    );
  }
}

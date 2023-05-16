import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';

class LocalizationProfile extends StatelessWidget {
  const LocalizationProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OutlinedButton(onPressed: (){
            Get.updateLocale(Locale('en','us'));
          }, child: Text("English".tr)),
          20.height,
          OutlinedButton(onPressed: (){
            Get.updateLocale(Locale('ar','jo'));
          }, child: Text("Arabic".tr)),

      ],),
    );
  }
}

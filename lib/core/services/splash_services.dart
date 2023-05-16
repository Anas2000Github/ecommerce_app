import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learn_flutter_with_firebase/view/control_view.dart';


class SplashServices extends GetxController{

  ValueNotifier<bool> _loading =ValueNotifier(false);
  ValueNotifier<bool> get loading =>_loading;

  @override
  void onInit() {
    splash();
    super.onInit();
  }


  splash(){
    _loading.value=true;
    Timer( const Duration(seconds: 3), (){
      Get.off(ControlView());
    });
    _loading.value=false;
    update();
  }

}
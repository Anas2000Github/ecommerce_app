
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constance.dart';


class CheckOutViewModel extends GetxController {

  RxInt get activeStep => _activeStep;
  RxInt _activeStep = 0.obs;

  RxBool get checkBox => _checkBox;
  RxBool _checkBox = false.obs;


  String? street1, street2, city, state, country;

  GlobalKey<FormState> formState = GlobalKey();

  Color getColor(int i) {
    if (i == _activeStep) {
      return greenColor;
    } else if (i > _activeStep.value) {
      return greyColor;
    }
    return greenColor;
  }


  increase() {
    _activeStep.value ++;
     update();
  }

  checkBoxBool() {
    if(_checkBox.value==false){
      _checkBox.value=true;
    }else{
      _checkBox.value=false;
    }

     update();
  }

  decrease(){
  _activeStep.value--;
  if(_activeStep.value < 0){
    Get.back();
  }
    update();
  }


}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/auth/home_screen.dart';
import '../../view/card_view.dart';
import '../../view/profile_view.dart';

class ControlViewModel extends GetxController{

  var _navigatorValue = 0;

  get navigatorValue => _navigatorValue;

  Widget? _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;

  void changSelectedValue(var selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue) {
      case 0 :
          _currentScreen= HomeScreen();
        break;
      case 1 :
       _currentScreen = CardView();
        break;

      case 2 :
        _currentScreen =ProfileView();
        break;
    }
    update();
  }
}
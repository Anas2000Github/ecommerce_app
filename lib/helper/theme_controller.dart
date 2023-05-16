import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {


  @override
  void onInit() {
    super.onInit();
    // getSavedThemeMode();
    // _getThemeStatus();
  }

  // GetStorage box = GetStorage();

  // ThemeMode _themeMode = ThemeMode.system;
  // ThemeMode get themeMode => _themeMode;

  //  setThemeMode(ThemeMode theme) async {
  //   loading.value=true;
  //   Get.changeThemeMode(theme);
  //   _themeMode = theme;
  //   box.write("theme", themeMode.toString().split('.')[1]);
  //   // _getThemeStatus();
  //   loading.value=false;
  //   update();
  // }
  //
  // getSavedThemeMode() async {
  //   loading.value=true;
  //   var savedTheme = box.read("theme") ?? "system";
  //   // import 'package:flutter/foundation.dart';for this
  //   _themeMode = ThemeMode.values.firstWhere((e) => describeEnum(e) == savedTheme);
  //   Get.changeThemeMode(themeMode);
  //   _saveThemeStatus();
  //   loading.value=false;
  //
  //   update();
  // }


// RxBool _isLightTheme = false.obs;
//
// Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
// _saveThemeStatus() async {
//   SharedPreferences pref = await _prefs;
//   pref.setBool('theme', _isLightTheme.value);
// }
//
// _getThemeStatus() async {
//   var _isLight = _prefs.then((SharedPreferences prefs) {
//     return prefs.getBool('theme') != null ? prefs.getBool('theme') : true;
//   }).obs;
//   _isLightTheme.value = (await _isLight.value)!;
//   Get.changeThemeMode(_isLightTheme.value ? ThemeMode.light : ThemeMode.dark);
//   // Get.changeTheme( _isLightTheme.value ? ThemeData.light() : ThemeData.dark());
// }

}
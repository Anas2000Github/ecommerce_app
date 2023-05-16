import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learn_flutter_with_firebase/core/view_model/cart_view_model.dart';
import 'package:learn_flutter_with_firebase/core/view_model/home_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/splash_screen.dart';
import 'helper/binding.dart';
import 'helper/languages.dart';
import 'helper/local_storeg_data.dart';
import 'helper/my_theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  Get.put(LocalStorageData());
  await GetStorage.init();

  runApp(MyApp());
}
// in main method

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: Binding(),
    translations: Languages(),
    locale: Locale('ar', 'jo',
    ),
    // locale: Get.deviceLocale,
    fallbackLocale: const Locale('en', 'US'),
    theme: ThemeData.light().copyWith(
      iconTheme: IconThemeData(color: Colors.black),
      indicatorColor:  Colors.grey,
      // fontFamily: 'SourceSansPro',
    ),
    darkTheme: ThemeData.dark().copyWith(
    iconTheme: IconThemeData(color: Colors.grey),
    indicatorColor:  Colors.grey,
    // fontFamily: 'SourceSansPro',
    ),
    // themeMode: ThemeMode.system,
    home: Scaffold(
    body: SplashScreen(
    )
    ,
    )
    ,
    );


  }
}

/// mvvm --> model View  ViewModel
/// firebase back end
/// GetX



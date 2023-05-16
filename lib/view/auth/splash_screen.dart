import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/core/services/splash_services.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Constants.splashScreenColor,
      body: GetBuilder<SplashServices>(
        init: SplashServices(),
        builder:(controller)=> Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Center(
               child: ClipOval(
                  child: Image.asset('assets/images/splashScreen.png',fit: BoxFit.fill,
                  width: 300,)),
             ),

          ],
        ),
      ),
    );
  }
}


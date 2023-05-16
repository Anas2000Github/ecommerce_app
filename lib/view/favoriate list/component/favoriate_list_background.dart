import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';

class FavoriateListBackground extends StatelessWidget {
  final Widget child;
  const FavoriateListBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
         Get.isDarkMode? Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_top.png",
              width: size.width * 0.4,
            ),
          ):1.width,
          Get.isDarkMode? Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/bottom.png",
              width: size.width * 0.4,
            ),
          ):1.width,
          child,
        ],
      ),
    );
  }
}

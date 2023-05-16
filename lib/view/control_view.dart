
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/core/view_model/auth_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/splash_screen.dart';
import 'package:learn_flutter_with_firebase/view/profile_view.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';
import '../core/view_model/control_view_model.dart';
import 'auth/home_screen.dart';
import 'auth/login_screen.dart';
import 'card_view.dart';

class ControlView extends GetWidget<AuthViewModel>{

   ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
        return (controller.user == null)
            ? LoginScreen()
            :  GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder:(controller)=> Scaffold(
              bottomNavigationBar: _bottomNavigationBar(),
              body: controller.currentScreen),
            );
      }
    );
  }
  Widget  _bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => BottomNavigationBar(items: [
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding:  EdgeInsets.only(top: 25),
              child:  Container(
                alignment: Alignment.center,
                child: Text(
                  'Explore'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ) ,
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset("assets/icons/Icon_Explore.png",fit: BoxFit.contain,width: 20,),
            )),
        BottomNavigationBarItem(
            activeIcon: Padding(
              padding:  EdgeInsets.only(top: 25),
              child:   Container(
                alignment: Alignment.center,
                child: Text(
                  'Cart'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ) ,
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset("assets/icons/Icon_Cart.png",fit: BoxFit.contain,width: 20),
            )),
        BottomNavigationBarItem(
            activeIcon:  Padding(
              padding:  EdgeInsets.only(top: 25),
              child:  Container(
                alignment: Alignment.center,
                child: Text(
                  'person'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ) ,
            label: '',
            icon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset("assets/icons/person.png",fit: BoxFit.contain,width: 20),
            )),

      ],
        elevation: 0.0,
        currentIndex: controller.navigatorValue,
        onTap: (index) {
        controller.changSelectedValue(index);},
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}


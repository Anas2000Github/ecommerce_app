import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/core/view_model/profile_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/check_out/summary.dart';
import 'package:learn_flutter_with_firebase/view/profile_pages/edit_profile.dart';
import 'package:learn_flutter_with_firebase/view/profile_pages/localization_profile.dart';
import 'package:learn_flutter_with_firebase/view/profile_pages/them_profile.dart';
import 'package:learn_flutter_with_firebase/view/widgets/CustomListTile.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/theme_controller.dart';
import 'favoriate list/favoriate_list.dart';

class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value == true
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 25,),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(onPressed: (){
                            Get.isDarkMode? controller.setThemeMode(ThemeMode.light): controller.setThemeMode(ThemeMode.dark);
                            // _saveThemeStatus();
                          }, icon:Get.isDarkMode? Icon(Icons.light_mode, color: Colors.yellow[700])
                              : Icon(
                            Icons.dark_mode,
                            color: Colors.purple[400],
                          )),
                        ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: Get.width*.35,
                              height: Get.height*.17,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                image: DecorationImage(
                                  // image: AssetImage('assets/images/Avatar.png',),
                                  image: controller.userModel != null ||
                                          controller.userModel?.pic == 'default'
                                      ? AssetImage(
                                          'assets/images/Avatar.png',
                                        )
                                      // :  AssetImage('assets/images/Avatar.png',),
                                      : NetworkImage(controller.userModel!.pic!)
                                          as ImageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width*.55,
                              alignment: Alignment.topLeft,
                              child: Column(
                                children: [
                                  CustomText(
                                    text: controller.userModel!.name,
                                    fontsize: 23,
                                  ),
                                  CustomText(
                                    text: controller.userModel!.email,
                                  ),
                                ],
                              ),
                            ),

                          ],
                              ),),
                      50.height,

                      CustomListTile.listTileStyle(
                        onPressed: () {
                          Get.to(EditProfile());
                        },
                        text: 'Edit_Profile'.tr,
                        imageUrl: 'assets/images/Icon_Edit-Profile.png',
                      ),
                      10.height,
                      CustomListTile.listTileStyle(
                        onPressed: () {
                          Get.to(LocalizationProfile());
                        },
                        text: 'Language'.tr,
                        imageUrl: 'assets/images/Icon_Location.png',
                      ),
                      10.height,
                      CustomListTile.listTileStyle(
                        onPressed: () {
                          Get.to(FavoriateList());
                          // Get.to(ThemeProfile());
                        },
                        text: 'Order_History'.tr,
                        imageUrl: 'assets/images/Icon_History.png',
                      ),
                      10.height,
                      CustomListTile.listTileStyle(
                        onPressed: () {},
                        text: 'Cards'.tr,
                        imageUrl: 'assets/images/Icon_Payment.png',
                      ),
                      10.height,
                      CustomListTile.listTileStyle(
                        onPressed: () {},
                        text: 'Notifications'.tr,
                        imageUrl: 'assets/images/Icon_Alert.png',
                      ),
                      10.height,
                      CustomListTile.listTileStyle(
                        onPressed: () {
                          Get.offAll(LoginScreen());
                        },
                        text: 'Log_Out'.tr,
                        imageUrl: 'assets/images/Icon_Exit.png',
                      ),
                      10.height,
                    ],
                  ),
                ),
    ))

    );
  }
}

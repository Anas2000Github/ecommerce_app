import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/core/view_model/auth_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/home_screen.dart';
import 'package:learn_flutter_with_firebase/view/auth/register_screen.dart';
import 'package:learn_flutter_with_firebase/view/auth/second_screen.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_button.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_button_social_media.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_textformfield.dart';

import '../../constance.dart';
import '../control_view.dart';

class LoginScreen extends GetWidget<AuthViewModel> {

   LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.only(
          top: 5,
          right: 18,
          left: 18,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.change_circle),
                        color: Constants.primaryColor,
                        onPressed: () {
                          controller.changeTheme();
                        },
                      ),
                      CustomText(text: 'Language'.tr),

                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      CustomText(
                        text: 'Welcome,'.tr,
                        fontsize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(RegisterScreen());

                        },
                        child: CustomText(
                          text: 'Sign_Up'.tr,
                          fontsize: 18,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  10.height,
                  CustomText(
                    text: 'Sign_in_to_Continue'.tr,
                    fontsize: 14,
                    color: Colors.grey,
                  ),
                  33.height,
                   CustomTextFormField.textFieldStyle(
                      text: 'Email'.tr,
                      hintText:  'iamdavid@gmail.com',
                      onSaved: (value) {
                    controller.email=value!;
                  },
                    validator: (value) {
                      if(value==null){
                        print("Error".tr);
                      }
                    },
                  ),

                  14.height,
                   CustomTextFormField.textFieldStyle(
                      text: 'Password'.tr,
                      hintText:  '***********',
                      onSaved: (value) {
                        controller.password=value!;
                      },
                    validator: (value) {
                      if(value==null){
                        print("Error.tr");
                      }
                    },
                  ),
                  18.height,
                  CustomText(
                    text: 'Forgot_Password'.tr,
                    fontsize: 14,
                    alignment: Alignment.topRight,
                  ),
                  18.height,
                  CustomButton.buttonStyle(
                    text: "SIGN_IN".tr,
                    onPressed: () {
                      _formKey.currentState!.save();
                    if( _formKey.currentState!.validate()){
                      controller.signInWithEmailAndPassword();
                    }
                    },
                    colorButton: Constants.primaryColor,
                  ),
                  33.height,
                  CustomText(
                    text: 'OR'.tr,
                    alignment: Alignment.center,
                  ),
                  33.height,
                  CustomButtonSocialMedia.buttonStyle(
                    onPressed: (){
                      Get.offAll(ControlView());
                      // controller.facebookSignInMethod();
                    },
                    text: 'Sign_In_with_Facebook'.tr,
                    imageUrl: 'assets/icons/facebook.png',
                  ),
                  40.height,
                  CustomButtonSocialMedia.buttonStyle(
                    onPressed: (){
                    controller.googleSignInMethod();
                    },
                    text: 'Sign_In_with_Google'.tr,
                    imageUrl: 'assets/icons/google.png',
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension padding on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}
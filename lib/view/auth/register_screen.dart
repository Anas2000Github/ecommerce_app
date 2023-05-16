import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/core/view_model/auth_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/auth/second_screen.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_button.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_button_social_media.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_textformfield.dart';

import '../../constance.dart';

class  RegisterScreen extends GetWidget<AuthViewModel> {

  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:Color.fromRGBO(221, 221, 221, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(221, 221, 221, 1),
        leading:  InkWell(
          onTap: (){
            Get.off(LoginScreen());
          },
            child: Icon(Icons.arrow_back,color: Colors.black,)) ,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 33,
          right: 18,
          left: 18,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child:  Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Column(
                children: [
                  CustomText(
                     text: 'Sign_Up'.tr,
                     fontsize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                   ),
                  33.height,
                  CustomTextFormField.textFieldStyle(
                      text: 'Name'.tr,
                      hintText:  'Enter_your_name'.tr,
                      onSaved: (value) {
                        controller.name=value!;
                      },
                    validator: (value) {
                      if(value==null){
                        print("Error.tr");
                      }
                    },
                  ),
                  14.height,
                   CustomTextFormField.textFieldStyle(
                      text: 'Email'.tr,
                      hintText:  'iamdavid@gmail.com',
                      textColor: Colors.grey[500],
                      hintColor: Colors.grey[900],

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
                      hintColor: Colors.grey[900],
                      onSaved: (value) {
                      controller.password=value!;
                    },
                    validator: (value) {
                      if(value==null){
                        print("Error");
                      }
                    },
                  ),
                 33.height,
                  CustomButton.buttonStyle(
                    text: "Sign_Up".tr,
                    onPressed: () {
                      _formKey.currentState!.save();
                      if( _formKey.currentState!.validate()){
                        controller.createAccountWithEmailAndPassword();
                      }
                    },
                    colorButton: Constants.primaryColor,
                  ),
                  18.height,

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

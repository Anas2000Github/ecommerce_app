import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/control_view.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_button.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_textformfield.dart';

import '../../core/view_model/profile_view_model.dart';

class EditProfile extends StatelessWidget {
   EditProfile({Key? key}) : super(key: key);

   final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
    builder: (controller) => Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: Get.height,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 100,horizontal: 20),
          child:  SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               InkWell(
                      onTap: (){

                      },
                      child: Column(
                        children: [
                          controller.userModel != null || controller.userModel?.pic == 'default'
                              ? Image.asset('assets/images/Avatar.png',)
                              : Image.network(controller.userModel!.pic.toString()),
                          10.height,
                          CustomText(
                            text: 'Edit_Your_Image'.tr,
                            alignment: Alignment.bottomCenter
                          )
                        ],
                      )
                  ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
                    child: Column(
                  children: [
                    CustomTextFormField.textFieldStyle(
                      hintText: 'Edit_Your_Name'.tr,
                      onSaved: (value) {
                        controller.userModel!.name=value;
                      },
                      validator: (value) {
                        if(value==null){
                        print("Error");
                      } },
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    CustomTextFormField.textFieldStyle(
                      hintText: 'Edit_Your_Email'.tr,
                      onSaved: (value) {
                        controller.userModel!.email=value;
                      },
                      validator: (value) {
                        if(value==null){
                        print("Error");
                      } },
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),

                  ],
                )),
                20.height,
                Container(
                 width: Get.width*.4,
                  child: CustomButton.buttonStyle(
                    text: 'Save'.tr,
                    onPressed: (){
                      _formKey.currentState!.save();
                      if( _formKey.currentState!.validate()){
                        print(_formKey.currentState!.validate());

                        controller.updateCurrentUser('Anas', 'aaaabd962@gmail.com');
                      }
                      // Get.offAll(ControlView());
                    },
                    colorButton: Constants.primaryColor,
                    paddingHorizontal: 50,
                    paddingVertical: 20,
                  ),
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

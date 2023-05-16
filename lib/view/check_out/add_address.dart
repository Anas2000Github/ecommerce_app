import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/core/view_model/check_out_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_textformfield.dart';

class AddAddress extends StatelessWidget {
  // const AddAddress({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder:(controller)=> Form(
        key: controller.formState,
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children:  [
                33.height,
                Row(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Checkbox(
                        shape: CircleBorder(),
                        activeColor: Constants.primaryColor,
                          value: controller.checkBox.value, onChanged: (value){
                            controller.checkBoxBool();
                      }),
                    ),
                    Text(
                      'Billing_address_is_the_same_as_delivery_address'.tr,
                    ),
                  ]
                ),
                13.height,
                CustomTextFormField.textFieldStyle(
                  text: "Street_1".tr,
                  hintText: '21_Alex_Davidson_Avenue'.tr,
                    hintColor: Colors.grey[900],
                  onSaved: (value) {
                    controller.street1=value!;
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      return "you_must_write_your_street".tr;
                    }
                  }

                ),
                CustomTextFormField.textFieldStyle(
                  text: 'Street_2'.tr,
                  hintText: 'Opposite_Omegatron_Vicent_Quarters'.tr,
                  hintColor: Colors.grey[900],
                  validator: (value){
                    if(value!.isEmpty){
                      return "you_must_write_your_Street_2".tr;
                    }
                  },
                  onSaved: (value){
                    controller.street2=value;
                  },
                ),
                CustomTextFormField.textFieldStyle(
                  text: 'City'.tr,
                  hintText: 'Victoria_Island'.tr,
                  hintColor: Colors.grey[900],
                  validator: (value){
                    if(value!.isEmpty){
                      return "you_must_write_your_City".tr;
                    }
                  },
                  onSaved: (value){
                    controller.city=value;
                  },
                ),
                Container(
                  width: Get.width,
                  child:Row(
                    children: [
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.only(right: 20),
                           child: CustomTextFormField.textFieldStyle(
                            text: 'State'.tr,
                            hintText: 'Lagos_State'.tr,
                             hintColor: Colors.grey[900],
                            validator: (value){
                              if(value!.isEmpty){
                                return "you_must_write_your_State".tr;
                              }
                            },
                             onSaved: (value){
                               controller.state=value;
                             },
                      ),
                         ),
                       ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CustomTextFormField.textFieldStyle(
                            text: 'Country'.tr,
                            hintText: 'Nigeria'.tr,
                            hintColor: Colors.grey[900],
                            validator: (value){
                              if(value!.isEmpty){
                                return "you_must_write_your_Country".tr;
                              }
                            },
                            onSaved: (value){
                              controller.country=value;
                            },
                          ),
                        ),
                      ),
                    ],
                  ) ,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/core/view_model/check_out_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/check_out/summary.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_button.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';

import '../../constance.dart';
import '../control_view.dart';
import 'add_address.dart';
import 'delevery_time.dart';

class CheckOutView extends  StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder:(controller)=> Scaffold(
            bottomSheet: Container(
              height: MediaQuery.of(context).size.height * .092,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Container(
                    decoration:
                    BoxDecoration(border: Border.all(color: Constants.primaryColor)),
                    child:  CustomButton.buttonStyle(
                      onPressed: () {
                        controller.decrease();
                      },
                      text:controller.activeStep >= 1 ? 'Back'.tr:'Get_out'.tr,
                      colorButton: Colors.white,
                      colorText: Colors.black,
                      paddingHorizontal: 60,
                      borderSize: 0,
                    ),
                  ),
                  CustomButton.buttonStyle(
                    onPressed: () {
                      if(controller.activeStep==0){
                        controller.increase();
                      } else if(controller.activeStep.value == 1){
                        controller.formState.currentState!.save();
                          if (controller.formState.currentState!.validate()) {
                            Get.to(Summary());
                          }
                        }
                      controller.update();
                    },
                    paddingHorizontal: 60,
                    borderSize: 0,
                    text: 'Next'.tr,
                    colorButton: Constants.primaryColor,
                  ),
                ],
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  CustomText(
                    text: 'CheckOut'.tr,
                    alignment: Alignment.center,
                  ),
                  30.height,
                  AnotherStepper(
                    stepperList: [
                      StepperData(
                          title: StepperText('Delevery'.tr,textStyle: TextStyle(height: 1.6,color: Constants.primaryColor)),
                          iconWidget: InkWell(
                            onTap: (){
                              controller.activeStep.value=0;
                              controller.update();
                            },
                            child: Container(
                              padding:  EdgeInsets.all(4),
                              decoration:  BoxDecoration(
                                  border: Border.all(color: Constants.primaryColor,width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(30))),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: controller.activeStep.value >= 0 ? Constants.primaryColor : Colors.white,

                              ),
                            ),
                          )),
                      StepperData(
                          title: StepperText('Address'.tr,textStyle: TextStyle(height: 1.6,color: controller.getColor(1))),
                          iconWidget: InkWell(
                            onTap: (){
                              controller.activeStep.value=1;
                              controller.update();
                            },
                            child: Container(
                              padding:  EdgeInsets.all(4),
                              decoration:  BoxDecoration(
                                  border: Border.all(color: controller.getColor(1),width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(30))),

                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: controller.activeStep.value >= 1 ? Constants.primaryColor : Colors.white,
                              ),
                            ),
                          )),
                      StepperData(
                          title: StepperText('Summarey'.tr,textStyle: TextStyle(height: 1.6,color: controller.getColor(2))),
                          iconWidget: InkWell(
                            onTap: (){
                              if(controller.activeStep.value ==1){
                                controller.formState!.currentState!.save();
                                if (controller.formState!.currentState!.validate()) {
                                  Get.to(Summary());
                                }
                              }
                              controller.update();

                            },
                            child: Container(
                              padding:  EdgeInsets.all(4),
                              decoration:  BoxDecoration(
                                 border: Border.all(color: controller.getColor(2),width: 1),
                                  borderRadius: BorderRadius.all(Radius.circular(30))),
                              child:  CircleAvatar(
                                    radius: 20,
                                  backgroundColor: controller.activeStep.value >= 2 ? Constants.primaryColor : Colors.white,
                              ),
                            ),
                          )),
                    ],
                    stepperDirection: Axis.horizontal,
                    iconWidth: 25,
                    iconHeight: 25,
                    activeBarColor: Constants.primaryColor,
                    inActiveBarColor: Colors.grey.shade300,
                    inverted: true,
                    activeIndex: controller.activeStep.value,
                    barThickness: 2,
                  ),
                  controller.activeStep == 0
                      ? DeliveryTime()
                      : AddAddress(),
                  // : controller.activeStep == 1
                  //    ? AddAddress()
                  // : Summary(),

                ],
              ),
            ),
        ),
      ),

    );
  }

}


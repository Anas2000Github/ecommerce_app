import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/core/view_model/cart_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_button.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';
import '../constance.dart';


import 'check_out/check_out_view.dart';

class CardView extends StatelessWidget {
  // const CardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => Scaffold(
              body: controller.loading.value
                  ? Center(child: CircularProgressIndicator())
                  : controller.cartProductModel.length == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SvgPicture.asset(
                              'assets/images/card_empty.svg',
                              width: 200,
                              height: 200,
                            ),
                            33.height,
                            CustomText(
                              text: "Cart_Empty".tr,
                              fontsize: 32,
                              alignment: Alignment.topCenter,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height * .8,
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: controller.cartProductModel.length,
                                  itemBuilder: (context, index) {
                                    return Dismissible(
                                      confirmDismiss: (DismissDirection direction)async{
                                        return Get.dialog(
                                          AlertDialog(
                                            title: Text('are_your_sure'.tr),
                                            actions: [
                                              TextButton(onPressed: (){
                                                Get.back();
                                              }, child: Text("No".tr)),
                                              TextButton(onPressed: ()  async{
                                                 if(direction==DismissDirection.endToStart){
                                                  await controller.deleteProduct(index);
                                                  await controller.cartProductModel.removeAt(index);
                                                    Get.back();

                                                  }else if(direction==DismissDirection.startToEnd){
                                                  Get.back();
                                                }
                                              }, child: Text("Yes".tr)),
                                            ],
                                          ),
                                        );
                                      },
                                      background:Container(
                                        alignment: AlignmentDirectional.centerStart,
                                        color: Colors.yellow,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 50),
                                          child: Icon(Icons.star,color:Colors.white,size: 30,),
                                        ),
                                      ),
                                      key: Key(controller.cartProductModel[index].toString()),
                                      secondaryBackground: Container(
                                        alignment: AlignmentDirectional.centerEnd,
                                        color: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 50),
                                          child: Icon(Icons.delete,color:Colors.white,size: 30,),
                                        ),
                                      ),
                                      child: Container(
                                        height: 150,
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        padding: EdgeInsets.all(7),
                                        child: Card(
                                          shape:  RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                      ),
                                          elevation: 10,
                                          shadowColor:Constants.primaryColor ,
                                          child: Row(
                                            children: [
                                              Container(
                                                  width: Get.width *.3,
                                                  child: Image.network(
                                                    controller
                                                        .cartProductModel[index].image
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                  )),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(horizontal: 30),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      text: controller
                                                          .cartProductModel[index]
                                                          .name?.tr,
                                                      fontsize: 21,
                                                    ),
                                                    5.height,
                                                    CustomText(
                                                      color: Constants.primaryColor,
                                                      text:
                                                          '\$${controller.cartProductModel[index].price}',
                                                      fontsize: 21,
                                                    ),
                                                    20.height,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                      children: [
                                                        InkWell(
                                                          child: Container(
                                                            child: Icon(
                                                              Icons.add,
                                                              color: Colors.black,
                                                            ),
                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(30),
                                                                border: Border.all(color: Colors.green,width: 2)
                                                            ),
                                                          ),
                                                          onTap: (){
                                                            controller
                                                                .increaseQuantity(
                                                                index);
                                                          },
                                                        ),
                                                        20.width,
                                                        Container(
                                                          alignment:
                                                          Alignment.center,
                                                          child: Text(
                                                            controller
                                                                .cartProductModel[
                                                            index]
                                                                .quantity
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                        20.width,
                                                        InkWell(
                                                          onTap: (){
                                                            controller
                                                                .decreaseQuantity(
                                                                index);
                                                          },
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(30),
                                                                  border: Border.all(color: Colors.green,width: 2)
                                                              ),
                                                              child: Icon(
                                                                Icons.remove,
                                                                color: Colors.black,

                                                              ),
                                                          ),
                                                        ),
                                                        20.width,
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          20.height,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      CustomText(
                                          text: 'TOTAL'.tr,
                                          fontsize: 18,
                                          color: Colors.grey,
                                        ),
                                      5.height,
                                      Container(
                                          width: Get.width*.3,
                                          child: TextField(
                                            enabled: false ,
                                            decoration: InputDecoration(
                                              labelText: '\$${controller.totalPrice}',
                                              labelStyle: TextStyle(color: Constants.primaryColor,fontSize: 27),
                                              border: InputBorder.none
                                            ),
                                          ),
                                        ),

                                    ],
                                  ),
                                  CustomButton.buttonStyle(
                                    onPressed: () {
                                      Get.to(CheckOutView());
                                    },
                                    text: 'CHECKOUT'.tr,
                                    paddingHorizontal: 40,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
            ));
  }
}

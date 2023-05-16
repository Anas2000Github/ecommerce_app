// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/core/view_model/cart_view_model.dart';
import 'package:learn_flutter_with_firebase/core/view_model/home_view_model.dart';
import 'package:learn_flutter_with_firebase/model/cart_product_model.dart';
import 'package:learn_flutter_with_firebase/model/glasses_model.dart';
import 'package:learn_flutter_with_firebase/model/product_model.dart';
import 'package:learn_flutter_with_firebase/model/shoes_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/card_view.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_button.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';

import '../model/wristwatch_model.dart';

class DetailsView extends StatelessWidget {
  final ProductModel?  productModel;
  final WristwatchModel?  wristwatchModel;
  final ShoesModel? shoesModel;
  final GlassesModel?  glassesModel;


  DetailsView({
    this.productModel,
     this.wristwatchModel,
    this.shoesModel,
    this.glassesModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder:(controller)=> Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                color: Colors.grey[400],
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.arrow_back,size: 27,)),
                    Icon(Icons.favorite,
                    color: controller.favList.contains(productModel) ?
                      Colors.redAccent:
                      Get.theme.indicatorColor,),
                  ],
                ),
              ),
              Container(
                color: Colors.grey[400],
                padding: EdgeInsets.symmetric(horizontal: 50),
                height:Get.height * .28,
                width: Get.width ,
                child: Image.network(
                  productModel!.image.toString(),
                  fit: BoxFit.fill,
                  width: Get.width*.5,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        CustomText(
                        text: productModel!.name?.tr,
                        fontsize: 26,
                      ),
                        15.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 33),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "size",
                                  ),
                                  CustomText(
                                    text: productModel!.sized,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 33),
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "Color".tr,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        color: productModel!.color,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        15.height,
                        CustomText(
                          text: 'Details'.tr,
                          fontWeight: FontWeight.w500,
                          fontsize: 18,
                        ),
                        10.height,
                        SingleChildScrollView(
                          child: CustomText(
                            text: productModel!.description?.tr,
                            wordSpacing: 1.5,
                            fontsize: 16,
                            height: 2.3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          CustomText(
                            text: "PRICE".tr,
                            fontWeight: FontWeight.w200,
                            fontsize: 14,
                            alignment: Alignment.topLeft,

                          ),
                          CustomText(
                            text: '\$${productModel!.price}',
                            color: Constants.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontsize: 22,
                          ),
                        ],
                      ),
                       GetBuilder<CartViewModel>(
                         init: CartViewModel(),
                         builder:(controller)=> CustomButton.buttonStyle(
                          paddingHorizontal: 70,
                          paddingVertical: 16,
                          onPressed:() {
                            controller.addProduct(
                                CartProductModel(
                                  name: productModel!.name,
                                  image: productModel!.image,
                                  price: productModel!.price,
                                  productid: productModel!.productid,
                                  quantity: 1,
                                )
                            );
                          },
                          colorButton: Constants.primaryColor,
                          text: "ADD".tr,
                          borderSize: 5,
                      ),
                       ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

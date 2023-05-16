import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/core/view_model/cart_view_model.dart';
import 'package:learn_flutter_with_firebase/core/view_model/check_out_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            40.height,
            Container(
              height: 350,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.cartProductModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                            controller.cartProductModel[index].image.toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            maxLines: 1,
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              text:
                              '${controller.cartProductModel[index].name}'.tr,

                            ),
                          ),
                        ),
                        10.height,
                        CustomText(
                          color: Constants.primaryColor,
                          text: '\$ ${controller.cartProductModel[index].price}',
                          alignment: Alignment.bottomLeft,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => 15.width,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child:  Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Shipping_Address'.tr,
                        fontsize: 24,
                      ),
                      GetBuilder<CheckOutViewModel>(
                        builder: (controller) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            color: Colors.grey,
                            fontsize: 24,
                            text: '${controller.street1.toString() + ' , ' +
                                controller.street2.toString() + ' , ' +
                                controller.state.toString() + ' , ' +
                                controller.city.toString() + ' , ' +
                                controller.country.toString() }',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}

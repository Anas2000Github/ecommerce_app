import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';

import '../../constance.dart';
import '../../core/view_model/home_view_model.dart';
import '../favoriate list/component/favoriate_list_background.dart';
import '../widgets/custom_text.dart';

class WomenPage extends StatelessWidget {
  const WomenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder:(controller)=> Scaffold(
          body: FavoriateListBackground(
            child: Column(
              children: [
                20.height,
                Container(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color:Get.isDarkMode? Colors.grey[200] : Colors.black26,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: IconButton(
                      color: Theme.of(context).iconTheme.color,
                      icon: SvgPicture.asset(
                        "assets/svg/back.svg",
                      ),

                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: controller.glassesModel.length,
                      itemBuilder: (context, index) {
                        return Container(
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
                                      controller.glassesModel[index].image.toString(),
                                      fit: BoxFit.fill,
                                    )),
                                Container(
                                  width: Get.width*.6,
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller.glassesModel[index].name.toString().tr,
                                        fontsize: 21,
                                      ),
                                      5.height,
                                      CustomText(
                                        color: Constants.primaryColor,
                                        text:
                                        '\$${controller.glassesModel[index].price}',
                                        fontsize: 21,
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}

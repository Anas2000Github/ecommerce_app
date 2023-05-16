import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/core/view_model/home_view_model.dart';
import 'package:learn_flutter_with_firebase/view/auth/login_screen.dart';
import 'package:learn_flutter_with_firebase/view/category_pages/Devices.dart';
import 'package:learn_flutter_with_firebase/view/category_pages/women.dart';
import 'package:learn_flutter_with_firebase/view/detailes_view.dart';
import 'package:learn_flutter_with_firebase/view/searchbar_view.dart';
import '../category_pages/men.dart';
import '../widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    // homeViewModel.data.writeIfNull('favorite', Colors.grey);
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(context),
                      30.height,
                       CustomText(
                         text: "Categories".tr,
                         fontsize: 18,
                         fontWeight: FontWeight.w400,
                       ),
                       30.height,
                       _listViewCategory(),
                       40.height,
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           CustomText(
                             text: "Best_Selling".tr,
                             fontsize: 18,
                             fontWeight: FontWeight.w400,
                           ),
                           CustomText(
                             text: "see_all".tr,
                             fontsize: 16,
                           ),
                         ],
                       ),
                       30.height,
                       _listViewProducts(),

                    ],
                  ),
                ),
              ),
            ),
    );
  }

  ///search
  _searchTextFormField(BuildContext buildContext) {
    return MaterialButton(child:  Container(
          width: Get.width*.75,
          height: Get.height*.058,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200),
          child: Icon(Icons.search,color: Theme.of(buildContext).indicatorColor,)),onPressed: (){
        showSearch(context: buildContext, delegate: CustomSearshDelegate()
       );
      },
    );
  }

  _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => SizedBox(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  onTap: (){
                    switch(index){
                      case 0 : Get.to(DevicesPage());
                      break;
                      case 2 : Get.to(MenPage());
                      break;
                      case 4: Get.to(WomenPage());
                    }
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.network(
                        controller.categoryModel[index].image.toString()),
                  ),
                ),
                20.height,
                CustomText(
                  text: controller.categoryModel[index].name?.tr,
                  height: 1,
                )
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => 20.width,
        ),
      ),
    );
  }

  _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => Container(
        height: Get.height * .33,
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(DetailsView(
                  productModel: controller.productModel[index],
                ));
              },
              child: Container(
                width: Get.width * .36,
                alignment: Alignment.topRight,
                color: Colors.grey.shade200,
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey.shade300,
                      width: Get.width*.38,
                      height: Get.height*.17,
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            alignment: Alignment.topRight,
                            child: IconButton(
                                onPressed: () {
                                  if(controller.favList.contains(controller.productModel[index])){
                                    controller.removeFavItemToList(controller.productModel[index]);
                                  }else{
                                    controller.addFavItemToList(controller.productModel[index]);
                                  }
                                },
                                icon: Icon(Icons.favorite,
                                    color: controller.favList.contains(controller.productModel[index])
                                        ? Colors.redAccent
                                        : Theme.of(context).indicatorColor),
                          ),),
                          Container(
                            child: Expanded(
                              child: Image.network(
                                controller.productModel[index].image.toString(),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.height,
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        controller.productModel[index].name.toString().tr,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    8.height,
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        controller.productModel[index].description
                            .toString()
                            .tr,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    8.height,
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "\$${controller.productModel[index].price}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Constants.primaryColor,
                          height: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => 20.width,
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/constance.dart';
import 'package:learn_flutter_with_firebase/core/view_model/home_view_model.dart';
import 'package:learn_flutter_with_firebase/view/widgets/custom_text.dart';

import 'detailes_view.dart';


class CustomSearshDelegate extends SearchDelegate{

  HomeViewModel productView = Get.put(HomeViewModel());


  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: (){
       query='';
     }, icon: const Icon(Icons.clear))
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> images=[];
    List<String> Names=[];
    List<String> Description=[];
    List<String> Price=[];
    for (int i = 0; i < productView.productModel.length; i++) {
      var Name = productView.productModel[i].name?.tr;
      var image = productView.productModel[i].image;
      var description = productView.productModel[i].description;
      var price = productView.productModel[i].price;
      if(Name!.tr.toLowerCase().contains(query.toLowerCase())){
        Names.add(Name);
        images.add(image!);
        Description.add(description!);
        Price.add(price!);
      }
    }

    return Container(
      child: ListView.builder(
        itemCount: Names.length,
        itemBuilder: (context, index) {
          var Name = Names[index];
          var image = images[index];
          var description = Description[index];
          var price = Price[index];
          return  InkWell(
            onTap: () {
              Get.to(DetailsView(
                productModel: productView.productModel[index],
              ));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: Get.width*.4,
                      height: Get.height*.15,
                      child: Image.network(image,fit: BoxFit.fill,)),
                  Container(
                    width: Get.width*.33,
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        CustomText(
                            text: Name.tr,
                            fontsize: 22,
                            fontWeight: FontWeight.w300
                        ),
                        CustomText(
                          text: description.tr,
                          alignment: Alignment.bottomLeft,
                          fontsize: 12,
                          maxLines: 3,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[700],
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "\$${price}",
                      color: Constants.primaryColor,
                      height: 2,
                      fontsize: 16,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),

                ],
              ),
            ),
          );
        },),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> images=[];
    List<String> Names=[];
    List<String> Description=[];
    List<String> Price=[];
    for (int i = 0; i < productView.productModel.length; i++) {
      var Name = productView.productModel[i].name;
      var image = productView.productModel[i].image;
      var description = productView.productModel[i].description;
      var price = productView.productModel[i].price;
      if(Name!.toLowerCase().contains(query.toLowerCase())){
        Names.add(Name);
        images.add(image!);
        Description.add(description!);
        Price.add(price!);
      }
    }

    return Container(
      child: ListView.builder(
        itemCount: Names.length,
        itemBuilder: (context, index) {
          var Name = Names[index];
          var image = images[index];
          var description = Description[index];
          var price = Price[index];
          return  InkWell(
            onTap: () {
              Get.to(DetailsView(
                productModel: productView.productModel[index],
              ));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                    width: Get.width*.4,
                     height: Get.height*.15,
                    child: Image.network(image,fit: BoxFit.fill,)),
                  Container(
                    width: Get.width*.33,
                    alignment: Alignment.topLeft,
                    child: Column(
                       children: [
                         CustomText(
                           text: Name.toString().tr,
                           fontsize: 22,
                           fontWeight: FontWeight.w300
                       ),
                         CustomText(
                           text: description.tr,
                           alignment: Alignment.bottomLeft,
                           fontsize: 12,
                           maxLines: 3,
                           fontWeight: FontWeight.w400,
                           color: Colors.grey[700],
                         ),

                       ],
                     ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "\$${price}",
                      color: Constants.primaryColor,
                      height: 2,
                      fontsize: 16,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),

                ],
              ),
            ),
          );
        },),
    );
  }

}



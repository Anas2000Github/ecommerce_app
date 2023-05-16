import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_flutter_with_firebase/core/services/home_service.dart';
import 'package:learn_flutter_with_firebase/model/catogory_model.dart';
import 'package:learn_flutter_with_firebase/model/glasses_model.dart';
import 'package:learn_flutter_with_firebase/model/shoes_model.dart';
import 'package:learn_flutter_with_firebase/model/wristwatch_model.dart';

import 'package:get_storage/get_storage.dart';
import '../../model/product_model.dart';


class HomeViewModel extends GetxController {

  ValueNotifier<bool> get loading =>_loading;
  ValueNotifier<bool> _loading =ValueNotifier(false);

 List<CategoryModel> _categoryModel= [];
 List<CategoryModel> get categoryModel=>_categoryModel;

  List<ProductModel> _productModel= [];
  List<ProductModel> get productModel=>_productModel;

  List<ShoesModel> _shoesModel= [];
  List<ShoesModel> get shoesModel=>_shoesModel;

  List<GlassesModel> _glassesModel= [];
  List<GlassesModel> get glassesModel=>_glassesModel;

  List<WristwatchModel> _wristwatchModel= [];
  List<WristwatchModel> get wristwatchModel=>_wristwatchModel;

  TextEditingController textController = TextEditingController();

  var numOfItems = 0.obs;

  final List _favList = [];
  List get favList =>_favList;

  final data = GetStorage();

  bool _change=true;
  bool get change =>_change;

  addFavItemToList(product) {
    // if (!favList.contains(product)) {
    _favList.add(product);
    numOfItems++;
    data.write('favorite', _change);
    print('-------------add---------------');
    // } else {
    //   Get.snackbar(
    //     "Already There",
    //     "You Already Liked this Item!!",
    //     // backgroundColor: Color(int.parse(product.color.toString())),
    //     snackPosition: SnackPosition.BOTTOM,
    //     colorText: Colors.black,
    //     borderColor: Colors.indigo,
    //     borderRadius: 10,
    //     borderWidth: 2,
    //     barBlur: 0,
    //   );
    // }
    update();
  }


  removeFavItemToList(product) {
    // if (!favList.contains(product)) {
   _favList.remove(product);
    _change=false;
    numOfItems--;
    print('-------------remove---------------');
    update();
    // } else {
    //   Get.snackbar(
    //     "Already There",
    //     "You Already Liked this Item!!",
    //     // backgroundColor: Color(int.parse(product.color.toString())),
    //     snackPosition: SnackPosition.BOTTOM,
    //     colorText: Colors.black,
    //     borderColor: Colors.indigo,
    //     borderRadius: 10,
    //     borderWidth: 2,
    //     barBlur: 0,
    //   );
  }



  @override
  void onInit() async{
    if(data.read('favorite')!=null){
      _change = data.read('favorite');
    }
    super.onInit();
  }

  // void productsList(String productName) {
  //   List<ProductModel> results = [];
  //   if (productName.isEmpty) {
  //     results = productModel;
  //   } else {
  //     _loading.value =true;
  //     HomeService().getBesSelling().then((value) {
  //       for(int i=0 ; i<value.length ;i++){
  //         results = productModel[i].name
  //             .toString()
  //             .toLowerCase()
  //             .contains(productName.toLowerCase()) as List<ProductModel>;
  //         _loading.value=false;
  //       }
  //       update();
  //     });
  //
  //     }
  //
  //   }

    // final data = GetStorage();

  // addToFavourite(value)async{
  //   favourite.add(value);
  //   data.write('favorite', color);
  //   print(data.read('favorite'));
  //   update();
  // }
  //
  // removeFromFavourite(value ){
  //   favourite.remove(value);
  //   print(data.read('favorite'));
  //   update();
  // }


  HomeViewModel() {
    getCategory();
    getBestSellingProducts();
    getSellingShoes();
    getSellingGlasses();
    getSellingWristwatch();
  }

  getCategory() async {
     _loading.value =true;
     HomeService().getCategory().then((value) {
     for(int i=0 ; i<value.length ;i++){
       _categoryModel.add(CategoryModel.fromJson(value[i].data()));
       // print(_categoryModel.length);
       _loading.value=false;
     }
      update();
    });
  }

  getBestSellingProducts() async{
     _loading.value=true;
     HomeService().getBesSelling().then((value) {
       for(int i=0 ; i<value.length ;i++){
         _productModel.add(ProductModel.fromJson(value[i].data()));
         print(_productModel.length);
         _loading.value=false;
       }
       update();
     });
         }


  getSellingShoes() async{
    _loading.value=true;
    HomeService().getShoes().then((value) {
      for(int i=0 ; i<value.length ;i++){
        _shoesModel.add(ShoesModel.fromJson(value[i].data()));
        print(_shoesModel.length);
        _loading.value=false;
      }
      update();
    });
  }

    getSellingGlasses() async {
      _loading.value = true;
      HomeService().getGlasses().then((value) {
        for (int i = 0; i < value.length; i++) {
          _glassesModel.add(GlassesModel.fromJson(value[i].data()));
          print(_glassesModel.length);
          _loading.value = false;
        }
        update();
      });
    }

      getSellingWristwatch() async{
        _loading.value=true;
        HomeService().getWristwatch().then((value) {
          for(int i=0 ; i<value.length ;i++){
            _wristwatchModel.add(WristwatchModel.fromJson(value[i].data()));
            print(_wristwatchModel.length);
            _loading.value=false;
          }
          update();
        });
    }


      }

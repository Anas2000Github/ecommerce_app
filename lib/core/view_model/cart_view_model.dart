import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:learn_flutter_with_firebase/core/services/database/card_database__helper.dart';
import 'package:learn_flutter_with_firebase/model/cart_product_model.dart';
import 'package:learn_flutter_with_firebase/view/control_view.dart';

class CartViewModel extends GetxController {
  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  
  var dbHelper = CartDatabaseHelper.db;
  var change=0;

  CartViewModel() {
    getProduct();
  }


  getProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    _loading.value = false;
    getTotalPrice();

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price!) *
          _cartProductModel[i].quantity!);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productid == cartProductModel.productid) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice += double.parse(cartProductModel.price!) * cartProductModel.quantity!;
    print('added successfully =  ${cartProductModel.toString()}');
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity = _cartProductModel[index].quantity! + 1;
    _totalPrice += double.parse(_cartProductModel[index].price!);
    dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) {
    if(cartProductModel[index].quantity==1){
      return ;
    }else {
      _cartProductModel[index].quantity = _cartProductModel[index].quantity! - 1;
      _totalPrice -= double.parse(_cartProductModel[index].price!);
      dbHelper.updateProduct(_cartProductModel[index]);
    }
    update();
  }

  deleteProduct(int index) async {
    await dbHelper.clearDatabase(_cartProductModel[index]);
    _totalPrice -= double.parse(cartProductModel[index].price!) * cartProductModel[index].quantity!;
    dbHelper.updateProduct(_cartProductModel[index]);
    print("${_cartProductModel[index]} is Deleted");

    update();
  }

}

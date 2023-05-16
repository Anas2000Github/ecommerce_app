import 'dart:ui';
import 'package:learn_flutter_with_firebase/helper/extentions.dart';

class ShoesModel {
  String? name, image, description,  sized, price, productid;
  Color? color;
  ShoesModel(
      {this.name,
        this.image,
        this.sized,
        this.color,
        this.price,
        this.productid,
        this.description});

  ShoesModel.fromJson(dynamic json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    productid = json['productid'];
    image = json['image'];
    sized = json['sized'];
    color = HexColor.fromHex(json['color']);
    price = json['price'];
    description = json['description'];
  }

  toJson() {
    return {
      'name': name,
      'productid': productid,
      'image': image,
      'sized': sized,
      'color': color,
      'price': price,
      'description': description,
    };
  }
}

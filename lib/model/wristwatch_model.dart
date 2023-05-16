import 'dart:ui';
import 'package:learn_flutter_with_firebase/helper/extentions.dart';

class WristwatchModel {
  String? name, image, description,  sized, price, productid;
  Color? color;
  WristwatchModel(
      {this.name,
        this.image,
        this.sized,
        this.color,
        this.price,
        this.productid,
        this.description});

  WristwatchModel.fromJson(dynamic json) {
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

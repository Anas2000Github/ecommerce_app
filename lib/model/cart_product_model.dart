

class CartProductModel {
  String? name, image,price,productid;
  dynamic quantity;
  CartProductModel(
      {this.name,
        this.image,
        this.price,
        this.productid,
       this.quantity});

  CartProductModel.fromJson(dynamic json) {
    if (json == null) {
      return;
    }
    name = json['name'];
    productid = json['productid'];
    image = json['image'];
    price = json['price'];
    quantity = json['quantity'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productid': productid,
    };
  }

}

import 'cart_product_model.dart';

class OrderModel {
  String? userId, dateTime;
  Address? address;

  List<CartProductModel>? products;


  OrderModel({this.userId, this.dateTime, this.address, this.products});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'dateTime': dateTime,
      'address': address,
      'products': products,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      userId: map['userId'] as String,
      dateTime: map['dateTime'] as String,
      address: map['address'] as Address,
      products: map['products'] as List<CartProductModel>,
    );

  }
}

class Address {
  String? street1, street2, city, state, country;

  Address({
    this.street1,
    this.street2,
    this.city,
    this.state,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street1: map['street1'] as String,
      street2: map['street2'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
    );
  }
}

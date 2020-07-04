import 'package:flutter/foundation.dart';

class Cart {
  final id;
  final String name;
  final String description;
  final int price;
  final String image;
  final int discount;
   int quantity;
  Cart({this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.discount=0,
      this.quantity
      });
 toMap(){
    var map = Map<String, dynamic>();
    map['productId'] = id;
    map['productName'] = name;
    map['productPhoto'] =image;
    map['productPrice'] = price;
    map['productDiscount'] = discount;
    map['productQuantity'] = quantity;
    return map;
  }

  toJson() {
    return {
      'productId' : id.toString(),
      'productName' : name.toString(),
      'productPhoto' : image,
      'productPrice' : price.toString(),
      'productDiscount' : discount.toString(),
      'productQuantity' : quantity.toString(),
    };
  }
  
}

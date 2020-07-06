import 'package:flutter/foundation.dart';

class Product {
  final id;
  final String name;
  final String description;
  final bool isHot;
  final bool isNew;
  final int price;
  final String image;
  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.isHot,
      this.isNew});
}

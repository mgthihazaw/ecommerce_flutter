import 'package:flutter/foundation.dart';

class Product {
  final id;
  final String name;
  final String description;
  final bool isHot;
  final bool isNew;
  final int price;
  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.isHot,
      this.isNew});
}

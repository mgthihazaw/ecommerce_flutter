import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/product.dart' as model;
import '../services/product-service.dart';

class ProductProvider with ChangeNotifier {
  ProductService _productService;
  List<model.Product> _products;
  List<model.Product> _catProducts;

  ProductProvider() {
    _productService = new ProductService();
  }


///***************** Api Service **************************/
  Future<void> getProducts() async {
    try {
      var response = await _productService.getProducts();
      var data = json.decode(response.body);
      _products = _createProductList(data);
      notifyListeners();
    } catch (e) {
      print("ERROR");
      print(e);
    }
  }

  Future<void> fetchProductsByCategory(id) async {
    var response = await _productService.getProductByCategory(id);
    var data = json.decode(response.body);
    _catProducts = _createProductList(data);
    notifyListeners();
  }


///***************** Getters **************************/
  List<model.Product> get products {
    return [...this._products];
  }

  List<model.Product> get categoryProducts {
    return [...this._catProducts];
  }


/// ***************** utility methods *********************/
  List<model.Product> _createProductList(Map data) {
    List<model.Product> list = [];
    List productData = data["data"];
    productData.forEach((item) {
      list.add(model.Product(
          id: item["id"],
          name: item["name"],
          description: item["description"],
          price: item["price"],
          image: item["image"],
          isHot: (item["is_hot"]),
          isNew: item["isNew"]));
    });

    return list;
  }
}

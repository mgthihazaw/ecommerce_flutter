
import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/product.dart' as model;
import '../services/product-service.dart';

class ProductProvider with ChangeNotifier {
  ProductService _productService ;
  List<model.Product> _products;

  ProductProvider(){
    _productService= new ProductService();
  }

  Future<void> getProducts() async{
    try{
      var response =await _productService.getProducts();
    var data = json.decode(response.body);
    var loadData = data["data"];
    // print(loadData);
    List<model.Product> productData=[];
    loadData.forEach((item){
        productData.add(model.Product(
          id: item["id"],
          name: item["name"],
           description: item["description"],
           price: item["price"],
           isHot: (item["is_hot"]),
           isNew: item["isNew"]
        ));
    });
    // print(productData[1].name);
    _products = productData;
    notifyListeners();
    }catch(e){
      print("ERROR");
      print(e);
    }
  }

  List<model.Product> get products{
    return  [...this._products] ;
  }

}

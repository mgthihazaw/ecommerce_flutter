import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/category.dart' as model;
import '../services/category-service.dart';

class CategoryProvider with ChangeNotifier {
  CategoryService _categoryService;
  List<model.Category> _category = [];

  CategoryProvider() {
    _categoryService = CategoryService();
  }
/// ***************** Api service *********************/
  Future<void> fetchData() async {
    try {
      // print("DATA");
      var response = await _categoryService.getCategory();
      var data = json.decode(response.body);
      _category = _createCategoryList(data);
      notifyListeners();
    } catch (e) {
      print("Errro");
      print(e);
    }
  }
/// ***************** Getters *********************/
  List<model.Category> get categories {
    return [..._category];
  }

/// ***************** utility methods *********************/
  List<model.Category> _createCategoryList(Map data) {
    List<model.Category> list = [];
    List productData = data["data"];
    productData.forEach((item) {
      list.add(model.Category(
          id: item['id'], title: item['title'], image: item['image']));
    });
    return list;
  }
}

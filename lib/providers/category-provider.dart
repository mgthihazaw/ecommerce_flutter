import 'package:flutter/foundation.dart';
import 'dart:convert';
import '../models/category.dart' as model;
import '../services/category-service.dart';

class CategoryProvider with ChangeNotifier {
  CategoryService _categoryService;
  List<model.Category> _category = [];
  

  CategoryProvider(){
   _categoryService = CategoryService();
  }
  

  Future<void> fetchData() async {
    try {
      // print("DATA");
      var response =  await _categoryService.getCategory();
      var responseData = json.decode(response.body);

      var categoryData = responseData['data'];
      // print(categoryData);
      

       List<model.Category> loadCategory = [];
      categoryData.forEach(( element) {
        
       loadCategory.add(model.Category(
            id: element['id'],
            title: element['title'],
            image: element['image']));
      });
      _category = loadCategory;
      // print(_category);
      notifyListeners();
        
    } catch (e) {
      print("Errro");
      print(e);
    }
  }

  List<model.Category> get categories{
    // print("DATA");
    // print(_category);
    return [..._category];
  }
}

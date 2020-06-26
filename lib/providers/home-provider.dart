import 'package:flutter/foundation.dart';
import 'dart:convert';
import './category.dart' as pro;
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  List<pro.Category> _category = [];

  Future<void> fetchData() async {
    try {
      var response = await http.get("http://192.168.10.25:8000/api/");
      var responseData = json.decode(response.body);

      var categoryData = responseData['category'];

       List<pro.Category> loadCategory = [];
      categoryData.forEach(( element) {
        
       loadCategory.add(pro.Category(
            id: element['id'],
            title: element['title'],
            image: element['image']));
      });
      _category = loadCategory;
      print(_category);
      notifyListeners();
        
    } catch (e) {
      print(e);
    }
  }

  List<pro.Category> get categories{
    print("DATA");
    print(_category);
    return [..._category];
  }
}

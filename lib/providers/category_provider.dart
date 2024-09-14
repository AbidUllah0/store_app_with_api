import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_api/Utils/app_url/app_url.dart';
import '../Data/model/categories_model.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoriesModel> categoryList = [];

  Future<List<CategoriesModel>> getCategoryData() async {
    final response = await http.get(
      Uri.parse(AppUrl.categoryUri),
    );
    var data = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        for (Map i in data) {
          categoryList.add(CategoriesModel.fromJson(i));
        }
        return categoryList;
      } else {
        return throw Exception('Exception Occurs${Exception}');
      }
    } catch (e) {
      print("An Error Accured " + e.toString());
    }
    return categoryList;
    notifyListeners();
  }
}

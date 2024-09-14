import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_api/Utils/app_url/app_url.dart';
import '../Data/model/detail_product.dart';

class DetailProductProvider with ChangeNotifier {
  List<DetailProduct> detailList = [];

  Future<List<DetailProduct>> getProductDetail() async {
    final response = await http.get(Uri.parse(AppUrl.productUri));

    var data = jsonDecode(response.body);

    try {
      if (response.statusCode == 200) {
        for (Map i in data) {
          detailList.add(DetailProduct.fromJson(i));
        }
        return detailList;
      } else {
        return throw Exception('Exception Accurs${Exception}');
      }
    } catch (e) {
      print("An error accured ${e.toString()}");
    }
    return detailList;
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_api/Data/model/product_model.dart';
import 'package:store_app_api/Utils/app_url/app_url.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool loading) {
    _loading = loading;
  }

  Future<List<ProductModel>> getAllProduct() async {
    setLoading(true);
    final response = await http.get(
      Uri.parse(AppUrl.productUri),
    );

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        productList.add(ProductModel.fromJson(i));
      }
      setLoading(true);
      return productList;
    } else {
      setLoading(false);
      return productList;
    }
    notifyListeners();
  }
}

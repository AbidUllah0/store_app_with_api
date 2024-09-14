import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_api/Utils/app_url/app_url.dart';
import '../Data/model/UserModel.dart';

class UserProvider with ChangeNotifier {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(AppUrl.userUri));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return throw Exception("Exception Occurs ${Exception}");
    }
    notifyListeners();
  }
}

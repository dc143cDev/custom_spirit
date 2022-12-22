import 'dart:convert';

import 'package:kostamobile/model/user/user_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kostamobile/model/user/user_data.dart';

import '../network.dart';
import 'api_config.dart';
import 'package:kostamobile/model/user/user_model.dart';

class getProductApi {
  // static var client = http.Client();

  static Future<List<UserModel>?> getProductData() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Network network = Network('http://localhost:8000/get');
    var data = await network.getJsonData();
    print(data);
    return usersFromJson(data);
  }
//
// static Future<bool> saveUser(
//     UserModel model,
//     bool isEditMode,
//     ) async{
//   var userURL = 'http://localhost:8000/get';
//
//   if(isEditMode){
//     user
//   }
// }
}

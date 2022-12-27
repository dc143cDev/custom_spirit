import 'dart:convert';

import 'package:kostamobile/model/user/user_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kostamobile/model/user/user_data.dart';

import '../model/product/product_model.dart';
import '../network.dart';
import 'api_config.dart';
import 'package:kostamobile/model/user/user_model.dart';

class getProductApi {
  // static var client = http.Client();

  static Future<List<ProductModel>?> getProductData() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    Network network = Network('http://localhost:8000/getProduct');
    var data = await network.getJsonData();
    print(data);
    return productsFromJson(data);
  }
}

class getProductTable {
  getProductTableData() async {
    Network network = Network('http://localhost:8000/getProductTable');
    var tableData = await network.getJsonData();
    return tableData;
  }
}

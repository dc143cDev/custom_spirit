import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kostamobile/app/modules/admin/views/admin_view.dart';
import 'package:kostamobile/app/modules/home/views/home_view.dart';
import 'package:kostamobile/network.dart';
import 'package:get/get.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String userName = '';
  @override
  void initState() {
    super.initState();
    getMysqlData();
  }

  void getMysqlData() async {
    Network network = Network('http://localhost:8000/get');

    var jsonData = await network.getJsonData();
    var jsonData2 = await network.getJsonData();
    userName = jsonData[0]['user_name'];
    print(jsonData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AdminView(
        getData: jsonData,
      );
    }));
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
//
//
// Future<dynamic> getUserData() async {
//   var url = Uri.parse('http://localhost:8000/get');
//   http.Response response = await http.get(url);
//   var userJson = response.body;
//   var parsingData = jsonDecode(userJson);
//   print('${parsingData[0]['user_id']}');
//   return parsingData[0]['user_name'];
// }

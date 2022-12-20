import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kostamobile/network.dart';

class MyView extends StatefulWidget {
  MyView({this.getData});
  final dynamic getData;

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  late String userName = '';

  @override
  void initState() {
    super.initState();
    getTestData();
  }

  getTestData() async {
    Network network = Network('http://localhost:8000/get');

    var jsonData = await network.getJsonData();
    userName = await jsonData[0]['user_name'];
  }

  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text('${userName}'),
    );
  }
}

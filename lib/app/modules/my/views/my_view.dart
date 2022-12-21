import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kostamobile/network.dart';

class MyView extends StatefulWidget {
  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  //사용할 변수 미리 선언
  late String userName = '';
  late String userEmail = '';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      getTestData();
    });
    //state 진입시 api 데이터 파싱.
    print('asdf1');
  }

  getTestData() async {
    //url을 받아 데이터를 파싱하는 network 메소드 사용. 미리 만들어둠.
    //mysql db에서 유저 데이터를 받아오는 express api 호출
    Network network = Network('http://localhost:8000/get');

    var jsonData = await network.getJsonData();
    userName = await jsonData[0]['user_name'];
    userEmail = await jsonData[0]['user_email'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              FloatingActionButton(onPressed: () {
                getTestData();
                print('asdf');
              }),
              Text(
                '${userName}',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                '${userEmail}',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

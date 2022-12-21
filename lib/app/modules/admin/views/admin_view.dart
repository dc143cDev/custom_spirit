import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kostamobile/app/modules/my/views/my_view.dart';

import '../../home/views/home_view.dart';

class AdminView extends StatefulWidget {
  AdminView({this.getData});
  final dynamic getData;

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  late String userName;
  @override
  void initState() {
    super.initState();
    updateData(widget.getData);
  }

  void updateData(dynamic jsonData) {
    userName = jsonData[0]['user_name'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Text('${userName}'),
              FloatingActionButton(onPressed: () {
                Get.to(() => HomeView());
              })
            ],
          ),
        ),
      ),
    );
  }
}

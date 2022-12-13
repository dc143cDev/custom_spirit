import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/custom_controller.dart';

class CustomView extends GetView<CustomController> {
  const CustomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: LogoAB(),
        centerTitle: false,
      ),
      body: Center(
        child: Text(
          'CustomView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/funding_controller.dart';

class FundingView extends GetView<FundingController> {
  const FundingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      appBar: AppBar(
        backgroundColor: primaryLight,
        elevation: 0,
        title: LogoAB(),
        centerTitle: false,
      ),
      body: Center(
        child: Text(
          'FundingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

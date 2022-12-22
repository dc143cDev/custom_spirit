import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_web_controller.dart';

class AdminWebView extends GetView<AdminWebController> {
  const AdminWebView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminWebView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AdminWebView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/console_controller.dart';

class ConsoleView extends GetView<ConsoleController> {
  const ConsoleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConsoleView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ConsoleView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

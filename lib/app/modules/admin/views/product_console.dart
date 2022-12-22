import 'package:flutter/material.dart';

import '../../../../palette.dart';

class ProductConsole extends StatefulWidget {
  const ProductConsole({Key? key}) : super(key: key);

  @override
  State<ProductConsole> createState() => _ProductConsoleState();
}

class _ProductConsoleState extends State<ProductConsole> {
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
          'FundingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

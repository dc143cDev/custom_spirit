import 'package:flutter/material.dart';

import '../../../../palette.dart';

class FundingConsole extends StatefulWidget {
  const FundingConsole({Key? key}) : super(key: key);

  @override
  State<FundingConsole> createState() => _FundingConsoleState();
}

class _FundingConsoleState extends State<FundingConsole> {
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

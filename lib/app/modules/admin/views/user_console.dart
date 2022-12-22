import 'package:flutter/material.dart';

import '../../../../model/user/user_list.dart';
import '../../../../palette.dart';

class UserConsole extends StatefulWidget {
  const UserConsole({Key? key}) : super(key: key);

  @override
  State<UserConsole> createState() => _UserConsoleState();
}

class _UserConsoleState extends State<UserConsole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      // appBar: AppBar(
      //   backgroundColor: bgColor,
      //   elevation: 0,
      //   title: LogoAB(),
      //   centerTitle: false,
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 700,
                child: UserList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

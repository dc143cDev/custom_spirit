import 'package:flutter/material.dart';

class UserAddView extends StatefulWidget {
  const UserAddView({Key? key}) : super(key: key);

  @override
  State<UserAddView> createState() => _UserAddViewState();
}

class _UserAddViewState extends State<UserAddView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(backgroundColor: Colors.white, body: Container()));
  }
}

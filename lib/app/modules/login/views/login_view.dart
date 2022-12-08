import 'package:flutter/material.dart';
import 'package:kostamobile/app/modules/login/views/signup_view.dart';
import 'package:kostamobile/palette.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:http/http.dart' as http;

import '../login_platform.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  void signInWithNaver() async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.loggedIn) {
      print('accessToken = ${result.accessToken}');
      print('id = ${result.account.id}');
      print('email = ${result.account.email}');
      print('age = ${result.account.age}');

      setState(() {
        _loginPlatform = LoginPlatform.naver;
      });
    }
  }

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentBLue,
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                LogoL(),
                SizedBox(
                  height: 30,
                ),
                LinePrimary(),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (val) => val == "" ? "이메일을 입력해주세요" : null,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: accentBLue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    fillColor: primaryLight,
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: accentBLue,
                    ),
                    hintText: 'Enter your Email',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (val) => val == "" ? "비밀번호를 입력해주세요" : null,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: accentBLue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    fillColor: primaryLight,
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: accentBLue,
                    ),
                    hintText: 'Enter your Password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: primaryLight,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '- OR -',
                  style: TextStyle(
                    fontFamily: 'SM',
                    color: primaryLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(SignView());
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: primaryLight,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FloatingActionButton(
                  backgroundColor: Color(0xFF03C75A),
                  onPressed: () {
                    signInWithNaver();
                  },
                  child: Text(
                    'N',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SM',
                      fontSize: 32,
                      color: primaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

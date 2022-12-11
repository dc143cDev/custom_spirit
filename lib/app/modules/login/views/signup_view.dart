import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kostamobile/api/api.dart';
import 'package:kostamobile/palette.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../model/user.dart';

class SignView extends StatefulWidget {
  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  checkUserEmail() async {
    try {
      var response = await http.post(Uri.parse(API.validateEmail),
          body: {'user_email': emailController.text.trim()});

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['existEmail'] == true) {
          Fluttertoast.showToast(msg: '해당 이메일로 가입한 아이디가 존재합니다');
        } else {
          saveInfo();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  saveInfo() async {
    User userModel = User(
      1,
      userNameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    try {
      var res = await http.post(
        Uri.parse(API.signup),
        body: userModel.toJson(),
      );
      if (res.statusCode == 200) {
        var resSignup = jsonDecode(res.body);
        if (resSignup['success'] == true) {
          Fluttertoast.showToast(msg: '회원가입이 완료되었습니다');
          setState(() {
            userNameController.clear();
            emailController.clear();
            passwordController.clear();
          });
        } else {
          Fluttertoast.showToast(msg: '다시 시도해주세요');
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
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
                LogoD(),
                SizedBox(
                  height: 30,
                ),
                LineAccent(),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: userNameController,
                  validator: (val) => val == "" ? "닉네임을 입력해주세요" : null,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: primaryLight),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    fillColor: accentBLue,
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: primaryLight,
                    ),
                    hintText: 'Enter your UserName',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (val) => val == "" ? "이메일을 입력해주세요" : null,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: primaryLight),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    fillColor: accentBLue,
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: primaryLight,
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
                    hintStyle: TextStyle(color: primaryLight),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    fillColor: accentBLue,
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: primaryLight,
                    ),
                    hintText: 'Enter your Password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      checkUserEmail();
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: accentBLue,
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
                    color: accentBLue,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '1234',
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: accentBLue,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

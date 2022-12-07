import 'package:flutter/material.dart';
import 'package:kostamobile/palette.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                  onPressed: () {},
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontFamily: 'SM',
                      color: primaryLight,
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

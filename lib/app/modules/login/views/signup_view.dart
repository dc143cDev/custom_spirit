import 'package:flutter/material.dart';
import 'package:kostamobile/palette.dart';

class SignView extends StatefulWidget {
  const SignView({Key? key}) : super(key: key);

  @override
  State<SignView> createState() => _SignViewState();
}

class _SignViewState extends State<SignView> {
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryLight,
      body: Container(
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
              Form(
                key: formKey,
                child: TextFormField(
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
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: TextFormField(
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
                  'Create Account',
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
    );
  }
}

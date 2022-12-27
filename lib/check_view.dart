import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kostamobile/app/modules/admin_web/views/admin_web_view.dart';
import 'package:kostamobile/app/modules/home/views/home_view.dart';
import 'package:kostamobile/palette.dart';
import 'package:kostamobile/responsive.dart';

class CheckView extends GetView {
  CheckView({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String adminCode = '253';
  var AdminCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: accentBLue,
        body: Form(
          key: _formKey,
          child: Responsive.isDesktop(context)
              ? //desktop
              Container(
                  margin: EdgeInsets.symmetric(vertical: 180, horizontal: 120),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: LogoL(),
                          ),
                        ),
                        LineS(),
                        SizedBox(
                          width: 120,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                              ),
                              TextFormField(
                                controller: AdminCodeController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: accentBLue),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(50.0),
                                    ),
                                  ),
                                  fillColor: primaryLight,
                                  filled: true,
                                  hintText: 'Enter Your Admin code',
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextButton(
                                onPressed: () {
                                  if (AdminCodeController.text == '253') {
                                    Get.off(AdminWebView());
                                  }
                                },
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
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
                        SizedBox(
                          width: 400,
                          child: TextFormField(
                            controller: AdminCodeController,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: accentBLue),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50.0),
                                ),
                              ),
                              fillColor: primaryLight,
                              filled: true,
                              hintText: 'Enter Your Admin code',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            if (AdminCodeController.text == '253') {
                              Get.off(HomeView());
                            }
                          },
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
                      ],
                    ),
                  ),
                ),
        ));
  }
}

class LineS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: primaryLight,
          height: 132,
          width: 3,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: primaryLight,
          height: 15,
          width: 3,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          color: primaryLight,
          height: 132,
          width: 3,
        ),
      ],
    );
  }
}

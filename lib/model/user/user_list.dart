import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kostamobile/api/get_user_api.dart';
import 'package:kostamobile/model/user/user_add_view.dart';
import 'package:kostamobile/model/user/user_data.dart';
import 'package:kostamobile/model/user/user_model.dart';
import 'package:get/get.dart';

import '../../palette.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<UserModel> users = List<UserModel>.empty(growable: true);
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var userEmailController = TextEditingController();
  var userPasswordController = TextEditingController();

  saveUser() async {
    var url = "http://localhost:8000/createUser";
    final postJson = jsonEncode({
      "user_name": userNameController.text,
      "user_email": userEmailController.text,
      "user_password": userPasswordController.text,
    });
    print(postJson);
    try {
      var res = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: postJson,
      );
      if (res.statusCode == 200) {
        var resSignup = jsonDecode(res.body);
        if (resSignup['success'] == true) {
          Fluttertoast.showToast(msg: '회원가입이 완료되었습니다');
          setState(() {
            userNameController.clear();
            userEmailController.clear();
            userPasswordController.clear();
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

  updateUserData() async {}

  @override
  void initState() {
    super.initState();
  }

  Future<void> updateUser() async {
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Form(
            key: formKey,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 50,
                  // bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      controller: userEmailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      controller: userPasswordController,
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: accentBLue),
                      onPressed: () {
                        saveUser();
                      },
                      child: Text('Update data'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget userList(users) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: LogoAB(),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              loadUsers();
            },
            icon: Icon(
              Icons.refresh,
              color: accentBLue,
            ),
          ),
          IconButton(
            onPressed: () {
              updateUser();
            },
            icon: Icon(
              Icons.add_box,
              color: accentBLue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return UserData(
                        model: users[index],
                        onDelete: (UserModel model) {},
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: loadUsers(),
    );
  }

  Widget loadUsers() {
    return FutureBuilder(
        future: getUserApi.getUserData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<UserModel>?> model,
        ) {
          if (model.hasData) {
            return userList(model.data);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}

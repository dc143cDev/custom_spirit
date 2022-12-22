import 'package:flutter/material.dart';
import 'package:kostamobile/api/get_user_api.dart';
import 'package:kostamobile/model/user/user_add_view.dart';
import 'package:kostamobile/model/user/user_data.dart';
import 'package:kostamobile/model/user/user_model.dart';
import 'package:get/get.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<UserModel> users = List<UserModel>.empty(growable: true);

  @override
  void initState() {
    super.initState();
    loadUsers();

    // users.add(
    //   UserModel(
    //       userId: 1,
    //       userName: "test3",
    //       userEmail: "test3EMail",
    //       userPassword: "password"),
    // );
  }

  Widget userList(users) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    maximumSize: Size(80, 50),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                onPressed: () {
                  Get.to(UserAddView());
                },
                child: Text("add user"),
              ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

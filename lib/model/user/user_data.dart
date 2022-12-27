import 'package:flutter/material.dart';
import 'package:kostamobile/model/user/user_model.dart';
import 'package:kostamobile/palette.dart';
import 'package:kostamobile/responsive.dart';

class UserData extends StatelessWidget {
  const UserData({Key? key, this.model, this.onDelete}) : super(key: key);

  final UserModel? model;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: userWidget(context),
      ),
    );
  }

  Widget userWidget(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model!.userName!,
                  style: boldText(),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  model!.userEmail!,
                  style: boldText(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Responsive.isDesktop(context)
                      ? null
                      : MediaQuery.of(context).size.width - 180,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: () {},
                      ),
                      GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

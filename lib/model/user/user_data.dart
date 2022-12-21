import 'package:flutter/material.dart';
import 'package:kostamobile/model/user/user_model.dart';
import 'package:kostamobile/palette.dart';

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
        width: 200,
        decoration: BoxDecoration(
          color: Colors.blue,
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
        Container(
          width: 100,
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Text('input http image here'),
          height: 100,
        ),
        Padding(
          padding: EdgeInsets.all(8),
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
                width: MediaQuery.of(context).size.width - 180,
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
        )
      ],
    );
  }
}

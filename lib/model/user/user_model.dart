class UserModel {
  late int? userId;
  late String? userName;
  late String? userEmail;
  late String? userPassword;

  UserModel({this.userId, this.userName, this.userEmail, this.userPassword});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data["_userId"] = userId;
    _data["_userName"] = userName;
    _data["_userEmail"] = userEmail;
    _data["_userPassword"] = userPassword;

    return _data;
  }
}

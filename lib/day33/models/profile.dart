import 'package:ppkd_uqyy/day33/models/user.dart';

class ProfileModel {
  String? message;
  UserModel? user;

  ProfileModel({this.message, this.user});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    message: json["message"],
    user: json["data"] == null ? null : UserModel.fromJson(json["data"]),
  );
}

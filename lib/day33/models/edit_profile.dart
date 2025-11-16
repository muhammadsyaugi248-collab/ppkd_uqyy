class EditProfileModel {
  String? message;
  String? name;

  EditProfileModel({this.message, this.name});

  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      message: json["message"],
      name: json["data"]?["name"],
    );
  }
}

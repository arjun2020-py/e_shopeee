// To parse this JSON data, do
//
//     final loginResponiseModel = loginResponiseModelFromJson(jsonString);

class LoginResponiseModel {
  LoginResponiseModel({
    required this.token,
  });

  String? token;

  factory LoginResponiseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponiseModel(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}

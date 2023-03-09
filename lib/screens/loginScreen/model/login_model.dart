// To parse this JSON data, do
//
//     final loginAuthModel = loginAuthModelFromJson(jsonString);

import 'dart:convert';

LoginAuthModel loginAuthModelFromJson(String str) => LoginAuthModel.fromJson(json.decode(str));

String loginAuthModelToJson(LoginAuthModel data) => json.encode(data.toJson());

class LoginAuthModel {
    LoginAuthModel({
        required this.username,
        required this.password,
    });

    String? username;
    String? password;

    factory LoginAuthModel.fromJson(Map<String, dynamic> json) => LoginAuthModel(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}

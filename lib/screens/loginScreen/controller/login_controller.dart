import 'package:e_shopee/screens/loginScreen/model/login_model.dart';
import 'package:e_shopee/screens/loginScreen/model/login_reponsive.dart';
import 'package:e_shopee/screens/loginScreen/respositry/login_repositry.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../homeScreen/view/home_screen.dart';

class LoginController extends GetxController {
  TextEditingController nameController = TextEditingController(),
      passwrodController = TextEditingController();

  RxBool isLoading = false.obs;

  LoginResponiseModel? loginModel;

  void login(String name, String pass) async {
    isLoading.value = true;
    Either<String, LoginResponiseModel> result =
        await LoginRespositry().login(LoginAuthModel(username: name, password: pass));

    result.fold(
        (left) => Get.showSnackbar(GetSnackBar(
              duration: const Duration(seconds: 3),
              message: left,
              isDismissible: true,
            )), (right) {
      //loginModel;
      Get.to(HomeScreen());
    });
  }
}

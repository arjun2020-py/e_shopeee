import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_shopee/screens/loginScreen/model/login_model.dart';
import 'package:e_shopee/screens/loginScreen/utils/expection.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../model/login_reponsive.dart';

class LoginRespositry {
  var dio = Dio();
  Future<Either<String, LoginResponiseModel>> login(
      LoginAuthModel model) async {
    try {
      if (!kIsWeb) {
        bool isNetworkConeectionFound =
            await InternetConnectionChecker().hasConnection;

        if (!isNetworkConeectionFound) {
          return const Left('No internet connection found');
        }
      }
      final response = await dio.post('https://fakestoreapi.com/auth/login',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: model
          //  {"username": "mor_2314", "password": "83r5^_"}
          );

      return Right(LoginResponiseModel.fromJson(response.data));
    } on DioError catch (dioError) {
      return Left(DioErrorResponseString.getErrorString(dioError));
    } catch (e) {
      return Left(e.toString());
    }
  }
}

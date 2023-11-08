import 'dart:convert';

import 'package:taosel_user_app/core/constant/apis.dart';
import 'package:dio/dio.dart';

import 'package:taosel_user_app/data/local/hiva_helper.dart';
import 'package:taosel_user_app/data/remote/dio_helper.dart';

class LoginRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;

  LoginRepositories({required this.dioHelper, required this.hiveHelper});

  Future<Response> login(
      {required String phone, required String password}) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.loginUrl,
        data: {
          "phone": phone,
          "password": password,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      // String token = data['data']["token"];
      // await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}

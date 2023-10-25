import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:taosel_user_app/data/remote/dio_helper.dart';

import '../../core/constant/apis.dart';
import '../../data/local/hiva_helper.dart';

class ForgetPassRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;
  ForgetPassRepositories({required this.dioHelper, required this.hiveHelper});

// For Get Passworde
  Future<Response> forgetPass({
    required String phone,
  }) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.forgetUrl,
        data: {
          "phone": phone,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      String token = data['data']["token"];
      print(token);
      await hiveHelper.putData("token", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
  Future<Response> sendCodeAgain({
    required String phone,
  }) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: false,
        url: AutomationApi.forgetUrl,
        data: {
          "phone": phone,
        },
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      String token = data['data']["token"];
      print(token);
      await hiveHelper.putData("sendAgainToken", token);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
// change Password
  Future<Response> changePass({
    required String pass,
  }) async {
    try {
      final Response response = await dioHelper.postData(
        needAuth: true,
        url: AutomationApi.changePasswordUrl,
        data: {"password": pass},
      );

      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}

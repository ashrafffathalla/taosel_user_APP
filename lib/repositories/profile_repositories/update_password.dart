import 'dart:convert';

import 'package:taosel_user_app/core/constant/apis.dart';
import 'package:taosel_user_app/data/remote/dio_helper.dart';
import 'package:dio/dio.dart';

class UpdatePassword {
  final DioHelper dioHelper;
  UpdatePassword({required this.dioHelper});

  Future<Response> updatePassword({
    required String password,
  }) async {
    try {
      final Response response = await dioHelper.postData(
          url: AutomationApi.changePasswordUrl,
          data: {
            "password": password,
          },
          needAuth: true);
      return response;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}


import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:taosel_user_app/data/model/notification_model.dart';

import '../../core/constant/apis.dart';
import '../../data/model/favourite_model.dart';
import '../../data/remote/dio_helper.dart';

class FavouriteRepository {
  final DioHelper dioHelper;
  FavouriteRepository({required this.dioHelper});

  Future<FavouriteModel> getAllFavourites() async {
    try {
      final Response response = await dioHelper.getData(
          url: AutomationApi.getFavourite, needAuth: true);
      final data = jsonDecode(response.data) as Map<String, dynamic>;
      final FavouriteModel favouriteModel = FavouriteModel.fromJson(data);
      return favouriteModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}
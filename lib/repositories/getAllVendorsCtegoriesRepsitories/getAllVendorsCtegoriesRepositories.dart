import 'dart:convert';

import 'package:taosel_user_app/core/constant/apis.dart';
import 'package:dio/dio.dart';

import 'package:taosel_user_app/data/local/hiva_helper.dart';
import 'package:taosel_user_app/data/remote/dio_helper.dart';

import '../../data/model/allVendorsCategories.dart';

class GetAllVendorsCategoriesRepositories {
  final DioHelper dioHelper;


  GetAllVendorsCategoriesRepositories({required this.dioHelper,});

  Future<VendorCategoryModel> getAllVendorsCategoriesRepositories()async{
    try {
       Response response = await dioHelper.getData(
          url: AutomationApi.getAllVendorCategories, needAuth: true
      );

      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final VendorCategoryModel  vendorCategoryModel = VendorCategoryModel.fromJson(data);
      return vendorCategoryModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
}
/*
import 'dart:convert';

import 'package:taosel_user_app/core/constant/apis.dart';
import 'package:dio/dio.dart';

import 'package:taosel_user_app/data/local/hiva_helper.dart';
import 'package:taosel_user_app/data/model/allVendorsCategories.dart';
import 'package:taosel_user_app/data/remote/dio_helper.dart';

class GetAllVendorsCategoriesRepositories {
  final DioHelper dioHelper;
  final HiveHelper hiveHelper;

  GetAllVendorsCategoriesRepositories({required this.dioHelper, required this.hiveHelper});

  Future<VendorCategoryModel> getAllVendorsCategoriesRepositories()async{
    try {
      print('object11');
      final Response response = await dioHelper.getData(
          url: AutomationApi.getAllVendorCategories, needAuth: true
      );
      print('object12');
      final data = jsonDecode(response.data) as Map<String, dynamic>;
      final VendorCategoryModel vendorCategoryModel = VendorCategoryModel.fromJson(data);
      return vendorCategoryModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      print(error['message']);
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
}

*
* */
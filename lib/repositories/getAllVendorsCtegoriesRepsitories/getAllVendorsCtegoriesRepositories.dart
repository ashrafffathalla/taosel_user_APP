import 'dart:convert';
import 'dart:math';

import 'package:taosel_user_app/core/constant/apis.dart';
import 'package:dio/dio.dart';

import 'package:taosel_user_app/data/local/hiva_helper.dart';
import 'package:taosel_user_app/data/model/allVendorCategoryModel.dart';
import 'package:taosel_user_app/data/model/showVendor_model.dart';
import 'package:taosel_user_app/data/remote/dio_helper.dart';

import '../../data/model/allCategoryCategories.dart';
import '../../data/model/allVendors_model.dart';

class GetAllVendorsCategoriesRepositories {
  final DioHelper dioHelper;


  GetAllVendorsCategoriesRepositories({required this.dioHelper,});

  Future<AllCategoryVendorsModel> getAllVendorsCategoriesRepositories()async{
    try {
       Response response = await dioHelper.getData(
          url: AutomationApi.getAlCategorylVendors, needAuth: true
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final AllCategoryVendorsModel  vendorCategoryModel = AllCategoryVendorsModel.fromJson(data);
      return vendorCategoryModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
  ///------------------ALl Vendors
  Future<AllVendorCategoryModel> allVendorCategoryRepositories(id)async{
    try {
      print('JJj');
      Response response = await dioHelper.getData(
          url: 'https://taosel.com/api/vendor-categories/$id', needAuth: true
      );
      print('JJ2');
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final AllVendorCategoryModel  allVendorCategoryModel = AllVendorCategoryModel.fromJson(data);
      return allVendorCategoryModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];
    } catch (error) {
      throw '..Oops $error';
    }
  }
  Future<AllVendorsModel> allVendorsRepositories()async{
    try {
      Response response = await dioHelper.getData(
          url: AutomationApi.getAllVendors, needAuth: true
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final AllVendorsModel  allVendorsModel = AllVendorsModel.fromJson(data);
      return allVendorsModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
  ///---------------------------
 Future<ShowVendorModel> showVendorRepositories(id)async{
    try {
      Response response = await dioHelper.getData(
          url: 'https://taosel.com/api/vendors/$id', needAuth: true
      );
      var data = jsonDecode(response.data) as Map<String, dynamic>;
      final ShowVendorModel  showVendorModel = ShowVendorModel.fromJson(data);
      return showVendorModel;
    } on DioError catch (dioError) {
      var error = jsonDecode(dioError.response!.data) as Map<String, dynamic>;
      throw error['message'];

    } catch (error) {
      throw '..Oops $error';
    }
  }
}
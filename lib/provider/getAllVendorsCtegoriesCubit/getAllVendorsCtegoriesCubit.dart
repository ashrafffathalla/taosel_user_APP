import 'package:flutter/material.dart';
import 'package:taosel_user_app/data/model/allCategoryCategories.dart';
import 'package:taosel_user_app/data/model/allVendors_model.dart';
import 'package:taosel_user_app/provider/auth_cubit/auth_state.dart';
import 'package:bloc/bloc.dart';
import '../../data/model/allVendorCategoryModel.dart';
import '../../data/model/showVendor_model.dart';
import '../../repositories/getAllVendorsCtegoriesRepsitories/getAllVendorsCtegoriesRepositories.dart';
import 'getAllVendorsCtegoriesStates.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      {required this.repositories})
      : super(GetAllVendorsCategoriesInitial());
  final GetAllVendorsCategoriesRepositories repositories;


//allVendorsCategories
  AllCategoryVendorsModel? allCategoryVendors;
  getAllCategoryVendorsFun() async {
    emit(GetAllCategoryVendorsLoading());
    try {
       allCategoryVendors = await repositories.getAllVendorsCategoriesRepositories();
      emit(GetAllCategoryVendorsLoaded(/*allCategoryVendorsModel: allCategoryVendors!*/));
    } catch (e) {

      emit(GetAllCategoryVendorsError(error: e.toString()));
    }
  }
  ///------------Get All Cat Vendors
  AllVendorCategoryModel? allVendorCategoryModel;
  getAllVendorCategory(id) async {

    emit(GetAllVendorCategoryLoading());
    try {

      allVendorCategoryModel = await repositories.allVendorCategoryRepositories(id);
      emit(GetAllVendorCategoryLoaded(/*allVendorsModel: allVendorsModel*/));
    } catch (e) {
      emit(GetAllVendorCategoryError(error: e.toString()));
    }
  }
///------------Get All Vendors
   AllVendorsModel? allVendorsModel;
  getAllVendors() async {
    emit(GetAllVendorsLoading());
    try {
       allVendorsModel = await repositories.allVendorsRepositories();
      emit(GetAllVendorsLoaded(/*allVendorsModel: allVendorsModel*/));
    } catch (e) {
      emit(GetAllVendorsError(error: e.toString()));
    }
  }

  ///------------ShowVendor----------------
  ShowVendorModel? showVendorModel;
  showVendor(id) async {
    emit(ShowVendorLoading());
    try {
      showVendorModel = await repositories.showVendorRepositories(id);
      emit(ShowVendorLoaded(/*allVendorsModel: allVendorsModel*/));
    } catch (e) {
      emit(ShowVendorError(error: e.toString()));
    }
  }


  ///----------Addition Fun
  ///
  List<int> additions = [];
  List<Addition?>? features;

  // add addition to the list of additions
  addAddition(BuildContext context, Addition? addition,String quantity)async{
    emit(AdditionsLoading());
    additions.add(int.parse(addition!.id.toString()));
    // await repositories.addAddition(product_id: addition.id.toString(), quantity: quantity, additions: additions);
    // emit(AdditionsSuccess(features));
  }
  // // remove addition from the list of additions
  // removeAddition(BuildContext context, Feature? feature) {
  //   additions.remove(int.parse(feature!.id.toString()));
  //   final daysPrice = double.parse(feature.daily!
  //       ? BlocProvider.of<BookingCubit>(context).days!.toString()
  //       : "1");
  //   total = total - (double.parse(feature.price.toString()) * daysPrice);
  //   emit(AdditionsLoading());
  //   emit(AdditionsSuccess(features));
  // }
  int counter = 1;
  incrementCounter() {
    emit(CounterLoading());
     counter++;
    emit(CounterLoaded());
  }

  decrementCounter() {
    emit(CounterLoading());
    counter--;
    emit(CounterLoaded());
  }
}

import 'package:taosel_user_app/data/model/allCategoryCategories.dart';
import 'package:taosel_user_app/data/model/allVendors_model.dart';
import 'package:taosel_user_app/provider/auth_cubit/auth_state.dart';
import 'package:bloc/bloc.dart';
import '../../data/model/allVendorCategoryModel.dart';
import '../../repositories/getAllVendorsCtegoriesRepsitories/getAllVendorsCtegoriesRepositories.dart';
import 'getAllVendorsCtegoriesStates.dart';

class GetAllVendorsCategoriesCubit extends Cubit<HomeState> {
  GetAllVendorsCategoriesCubit(
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


}

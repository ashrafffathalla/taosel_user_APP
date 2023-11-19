import 'package:taosel_user_app/data/model/allVendorsCategories.dart';
import 'package:taosel_user_app/provider/auth_cubit/auth_state.dart';
import 'package:bloc/bloc.dart';
import '../../repositories/getAllVendorsCtegoriesRepsitories/getAllVendorsCtegoriesRepositories.dart';
import 'getAllVendorsCtegoriesStates.dart';

class GetAllVendorsCategoriesCubit extends Cubit<HomeState> {
  GetAllVendorsCategoriesCubit(
      {required this.getAllVendorsCategories})
      : super(GetAllVendorsCategoriesInitial());
  final GetAllVendorsCategoriesRepositories getAllVendorsCategories;


//allVendorsCategories
  VendorCategoryModel ? allVendorsCategoriesModel;
  getAllVendorsCategoriesFun() async {
    emit(GetAllVendorsCategoriesLoading());
    try {
      print('object1');
      await getAllVendorsCategories.getAllVendorsCategoriesRepositories();
      print('object0');
      emit(GetAllVendorsCategoriesLoaded(allVendorsCategoriesModel: allVendorsCategoriesModel!));
    } catch (e) {
      print(e.toString());
      emit(GetAllVendorsCategoriesError(error: e.toString()));
    }
  }



}

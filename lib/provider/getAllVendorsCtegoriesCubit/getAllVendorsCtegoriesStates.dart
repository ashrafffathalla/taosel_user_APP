import 'package:equatable/equatable.dart';
import 'package:taosel_user_app/data/model/allVendorsCategories.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}
class GetAllVendorsCategoriesInitial extends HomeState {}

class GetAllVendorsCategoriesLoading extends HomeState {}

class GetAllVendorsCategoriesLoaded extends HomeState {
  final VendorCategoryModel allVendorsCategoriesModel;
  const GetAllVendorsCategoriesLoaded({required this.allVendorsCategoriesModel});
  @override
  List<Object> get props => [allVendorsCategoriesModel];
}
class GetAllVendorsCategoriesError extends HomeState {
  final String error;
  const GetAllVendorsCategoriesError({required this.error});
  @override
  List<Object> get props => [error];
}
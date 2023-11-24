import 'package:equatable/equatable.dart';
import 'package:taosel_user_app/data/model/allCategoryCategories.dart';

import '../../data/model/allVendors_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}
class GetAllVendorsCategoriesInitial extends HomeState {}

class GetAllCategoryVendorsLoading extends HomeState {}

class GetAllCategoryVendorsLoaded extends HomeState {
  // final AllCategoryVendorsModel allCategoryVendorsModel;
  // const GetAllCategoryVendorsLoaded({required this.allCategoryVendorsModel});
  // @override
  // List<Object> get props => [allCategoryVendorsModel];
}
class GetAllCategoryVendorsError extends HomeState {
  final String error;
  const GetAllCategoryVendorsError({required this.error});
  @override
  List<Object> get props => [error];
}
///AllVendors States
class GetAllVendorCategoryLoading extends HomeState {}

class GetAllVendorCategoryLoaded extends HomeState {
  // final AllVendorsModel allVendorsModel;
  // const GetAllVendorsLoaded({required this.allVendorsModel});
  // @override
  // List<Object> get props => [allVendorsModel];
}
class GetAllVendorCategoryError extends HomeState {
  final String error;
  const GetAllVendorCategoryError({required this.error});
  @override
  List<Object> get props => [error];
}
///AllVendors States
class GetAllVendorsLoading extends HomeState {}

class GetAllVendorsLoaded extends HomeState {
  // final AllVendorsModel allVendorsModel;
  // const GetAllVendorsLoaded({required this.allVendorsModel});
  // @override
  // List<Object> get props => [allVendorsModel];
}
class GetAllVendorsError extends HomeState {
  final String error;
  const GetAllVendorsError({required this.error});
  @override
  List<Object> get props => [error];
}
///----------show Vendor
class ShowVendorLoading extends HomeState {}

class ShowVendorLoaded extends HomeState {
  // final AllVendorsModel allVendorsModel;
  // const GetAllVendorsLoaded({required this.allVendorsModel});
  // @override
  // List<Object> get props => [allVendorsModel];
}
class ShowVendorError extends HomeState {
  final String error;
  const ShowVendorError({required this.error});
  @override
  List<Object> get props => [error];
}
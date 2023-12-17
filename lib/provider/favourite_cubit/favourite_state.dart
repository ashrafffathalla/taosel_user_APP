import 'package:equatable/equatable.dart';

abstract class FavouriteState extends Equatable {
  const FavouriteState();
  @override
  List<Object> get props => [];
}
class GetFavouriteInitial extends FavouriteState {}
class GetFavouriteLoadingState extends FavouriteState {}
class GetFavouriteSuccessState extends FavouriteState {}
class GetFavouriteErrorState extends FavouriteState {
  final String error;
  const GetFavouriteErrorState({required this.error});
  @override
  List<Object> get props => [error];

}
import 'package:bloc/bloc.dart';
import 'package:taosel_user_app/data/model/favourite_model.dart';
import 'package:taosel_user_app/provider/favourite_cubit/favourite_state.dart';
import 'package:taosel_user_app/repositories/favourit_repositories/fav_repositories.dart';
class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(
      {required this.repositories})
      : super(GetFavouriteInitial());
  final FavouriteRepository repositories;

  FavouriteModel? favouriteModel;
  getAllFavourite() async {
    emit(GetFavouriteLoadingState());
    try {
      favouriteModel = await repositories.getAllFavourites();
      emit(GetFavouriteSuccessState(/*allCategoryVendorsModel: allCategoryVendors!*/));
    } catch (e) {
      emit(GetFavouriteErrorState(error: e.toString()));
    }
  }

}

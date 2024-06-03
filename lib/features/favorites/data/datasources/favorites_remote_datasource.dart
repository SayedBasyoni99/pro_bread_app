import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../models/get_favorites_model.dart';
import '../models/toggle_favorite_model.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';

abstract class FavoritesRemoteDataSource {
  Future<GetFavoritesModel> getFavorites();

  Future<ToggleFavoriteModel> toggleFavorite({
    required ToggleFavoriteParams params,
  });

}

class FavoritesRemoteDataSourceImpl implements FavoritesRemoteDataSource {

  @override
  Future<GetFavoritesModel> getFavorites() async {
    try {
      const String getFavoritesEndpoint = '/api/v1/favorites';
      final dynamic response = await dioConsumer.get(
        getFavoritesEndpoint,
      );

      if(response['status'] == 200){
        return GetFavoritesModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<ToggleFavoriteModel> toggleFavorite({
    required ToggleFavoriteParams params,
  }) async {
    try {
      const String toggleFavoriteEndpoint = '/api/v1/toggle-favorite';
      final dynamic response = await dioConsumer.post(
        toggleFavoriteEndpoint,
        body: params.toJson(),
      );

      if(response['status'] == 200){
        return ToggleFavoriteModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

}

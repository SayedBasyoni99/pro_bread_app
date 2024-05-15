import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/get_favorites_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/toggle_favorite_response.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, GetFavoritesResponse>> getFavorites({
    required NoParams params,
  });


  Future<Either<Failure, ToggleFavoriteResponse>> toggleFavorite({
    required ToggleFavoriteParams params,
  });


}

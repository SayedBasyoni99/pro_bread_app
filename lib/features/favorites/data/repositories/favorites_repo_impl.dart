import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasources/favorites_remote_datasource.dart';
import '../../domain/repositories/favorites_repo.dart';
import '../../domain/entities/get_favorites_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/toggle_favorite_response.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';


class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDataSource remote;

  FavoritesRepositoryImpl({
    required this.remote,
  });

  /// Impl
  @override
  Future<Either<Failure, GetFavoritesResponse>> getFavorites({required NoParams params}) async {
    try {
      final GetFavoritesResponse response = await remote.getFavorites();
        return Right<Failure, GetFavoritesResponse>(response);
      } on AppException catch (error) {
        Log.e('[getFavorites] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetFavoritesResponse>(error.toFailure());
      }
  }


  @override
  Future<Either<Failure, ToggleFavoriteResponse>> toggleFavorite({required ToggleFavoriteParams params}) async {
    try {
      final ToggleFavoriteResponse response = await remote.toggleFavorite(params: params);
        return Right<Failure, ToggleFavoriteResponse>(response);
      } on AppException catch (error) {
        Log.e('[toggleFavorite] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, ToggleFavoriteResponse>(error.toFailure());
      }
  }


}


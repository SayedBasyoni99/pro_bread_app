import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_favorites_response.dart';
import '../repositories/favorites_repo.dart';


class GetFavoritesUseCase extends UseCase<GetFavoritesResponse, NoParams> {
  final FavoritesRepository repository;

  GetFavoritesUseCase({required this.repository});

  @override
  Future<Either<Failure, GetFavoritesResponse>> call(NoParams params) async {
    return await repository.getFavorites(params: params);
  }
}




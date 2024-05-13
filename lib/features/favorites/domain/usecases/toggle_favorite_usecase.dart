import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/toggle_favorite_response.dart';
import '../repositories/favorites_repo.dart';


class ToggleFavoriteUseCase extends UseCase<ToggleFavoriteResponse, ToggleFavoriteParams> {
  final FavoritesRepository repository;

  ToggleFavoriteUseCase({required this.repository});

  @override
  Future<Either<Failure, ToggleFavoriteResponse>> call(ToggleFavoriteParams params) async {
    return await repository.toggleFavorite(params: params);
  }
}


class ToggleFavoriteParams extends Equatable {
  final int? dishId;

  const ToggleFavoriteParams({
    required this.dishId,
  });

  Map<String, dynamic> toJson() => {
    'dish_id': dishId,
  };

  @override
  List<Object?> get props => <Object?>[
    dishId,
  ];

}




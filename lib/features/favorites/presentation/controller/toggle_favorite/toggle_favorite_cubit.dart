import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/toggle_favorite_usecase.dart';
import '../../../domain/entities/toggle_favorite_response.dart';

part 'toggle_favorite_states.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  ToggleFavoriteCubit(this.toggleFavoriteUseCase) : super(const ToggleFavoriteInitialState(-1));

  Map<int, bool> favorites = {};

  Future<void> fToggleFavorite({
   required int dishId,
  }) async {
    emit(ToggleFavoriteLoadingState(dishId));
    final Either<Failure, ToggleFavoriteResponse> eitherResult = await toggleFavoriteUseCase(ToggleFavoriteParams(
      dishId: dishId,
    ));
    eitherResult.fold((Failure failure) {
      emit(ToggleFavoriteErrorState(message: failure.message?? 'please_try_again_later'.tr(), dishId: dishId));
    }, (ToggleFavoriteResponse response) {
      final bool isFav = response.message.contains('Add To Favorite');
      favorites[dishId] = isFav;
      emit(ToggleFavoriteSuccessState(dishId: dishId, isFavorite: isFav));
      

    });
  }
}


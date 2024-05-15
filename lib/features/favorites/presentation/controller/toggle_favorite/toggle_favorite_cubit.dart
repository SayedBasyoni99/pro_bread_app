import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/toggle_favorite_usecase.dart';
import '../../../domain/entities/toggle_favorite_response.dart';

part 'toggle_favorite_states.dart';

class ToggleFavoriteCubit extends Cubit<ToggleFavoriteState> {
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  ToggleFavoriteCubit(this.toggleFavoriteUseCase) : super(const ToggleFavoriteInitialState());


  Future<void> fToggleFavorite({
   required int dishId,
  }) async {
    emit(const ToggleFavoriteLoadingState());
    final Either<Failure, ToggleFavoriteResponse> eitherResult = await toggleFavoriteUseCase(ToggleFavoriteParams(
      dishId: dishId,
    ));
    eitherResult.fold((Failure failure) {
      emit(ToggleFavoriteErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (ToggleFavoriteResponse response) {
      emit(const ToggleFavoriteSuccessState());
    });
  }
}


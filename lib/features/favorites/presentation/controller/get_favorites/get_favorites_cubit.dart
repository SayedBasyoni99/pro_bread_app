import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../categories/domain/entities/get_dish_response.dart';
import '../../../domain/usecases/get_favorites_usecase.dart';
import '../../../domain/entities/get_favorites_response.dart';

part 'get_favorites_states.dart';

class GetFavoritesCubit extends Cubit<GetFavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  GetFavoritesCubit(this.getFavoritesUseCase) : super(const GetFavoritesInitialState());

  List<Dish> data = <Dish>[];

  Future<void> fGetFavorites() async {
    emit(const GetFavoritesLoadingState());
    final Either<Failure, GetFavoritesResponse> eitherResult = await getFavoritesUseCase(NoParams());
    eitherResult.fold((Failure failure) {
      emit(GetFavoritesErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (GetFavoritesResponse response) {
      data.clear();
      data.addAll(response.data);
      emit(GetFavoritesSuccessState(value: response.data));
    });
  }
}


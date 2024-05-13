import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/get_dish_usecase.dart';
import '../../../domain/entities/get_dish_response.dart';

part 'get_dish_states.dart';

class GetDishCubit extends Cubit<GetDishState> {
  final GetDishUseCase getDishUseCase;

  GetDishCubit(this.getDishUseCase) : super(const GetDishInitialState());

  Dish? data;

  Future<void> fGetDish({
   required int id,
  }) async {
    emit(const GetDishLoadingState());
    final Either<Failure, GetDishResponse> eitherResult = await getDishUseCase(GetDishParams(
      id: id,
    ));
    eitherResult.fold((Failure failure) {
      emit(GetDishErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (GetDishResponse response) {
      data = response.data;
      emit(GetDishSuccessState(value: response.data));
    });
  }
}


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/entities/get_dish_response.dart';
import '../../../domain/usecases/get_dishes_usecase.dart';
import '../../../domain/entities/get_dishes_response.dart';

part 'get_dishes_states.dart';

class GetDishesCubit extends Cubit<GetDishesState> {
  final GetDishesUseCase getDishesUseCase;

  GetDishesCubit(this.getDishesUseCase) : super(const GetDishesInitialState());

  List<Dish> data = <Dish>[];

  Future<void> fGetDishes({
   required String keyword,
   required int category,
   required int sales,
   required int rating,
  }) async {
    emit(const GetDishesLoadingState());
    final Either<Failure, GetDishesResponse> eitherResult = await getDishesUseCase(GetDishesParams(
      keyword: keyword,
      category: category,
      sales: sales,
      rating: rating,
    ));
    eitherResult.fold((Failure failure) {
      emit(GetDishesErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (GetDishesResponse response) {
      data.clear();
      data.addAll(response.data);
      emit(GetDishesSuccessState(value: response.data));
    });
  }
}


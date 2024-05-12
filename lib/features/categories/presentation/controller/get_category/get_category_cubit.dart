import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/get_category_usecase.dart';
import '../../../domain/entities/get_category_response.dart';

part 'get_category_states.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  final GetCategoryUseCase getCategoryUseCase;

  GetCategoryCubit(this.getCategoryUseCase) : super(const GetCategoryInitialState());

  Category? data;

  Future<void> fGetCategory({
   required int id,
  }) async {
    emit(const GetCategoryLoadingState());
    final Either<Failure, GetCategoryResponse> eitherResult = await getCategoryUseCase(GetCategoryParams(
      id: id,
    ));
    eitherResult.fold((Failure failure) {
      emit(GetCategoryErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (GetCategoryResponse response) {
      data = response.data;
      emit(GetCategorySuccessState(value: response.data));
    });
  }
}


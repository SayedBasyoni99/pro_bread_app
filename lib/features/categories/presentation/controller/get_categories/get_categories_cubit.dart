import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/entities/get_category_response.dart';
import '../../../domain/usecases/get_categories_usecase.dart';
import '../../../domain/entities/get_categories_response.dart';
part 'get_categories_states.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  GetCategoriesCubit(this.getCategoriesUseCase)
      : super(const GetCategoriesInitialState());

  List<Category> data = <Category>[];

  Future<void> fGetCategories() async {
    emit(const GetCategoriesLoadingState());
    final Either<Failure, GetCategoriesResponse> eitherResult =
        await getCategoriesUseCase(NoParams());
    eitherResult.fold((Failure failure) {
      emit(GetCategoriesErrorState(
          message: failure.message ?? 'pleaseTryAgainLater'));
    }, (GetCategoriesResponse response) {
      data.clear();
      data.addAll(response.data);

      

      emit(GetCategoriesSuccessState(value: response.data));
    });
  }
}

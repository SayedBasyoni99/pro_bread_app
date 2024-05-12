import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_categories_response.dart';
import '../repositories/categories_repo.dart';


class GetCategoriesUseCase extends UseCase<GetCategoriesResponse, NoParams> {
  final CategoriesRepository repository;

  GetCategoriesUseCase({required this.repository});

  @override
  Future<Either<Failure, GetCategoriesResponse>> call(NoParams params) async {
    return await repository.getCategories(params: params);
  }
}




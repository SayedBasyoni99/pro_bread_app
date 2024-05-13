import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_category_response.dart';
import '../repositories/categories_repo.dart';


class GetCategoryUseCase extends UseCase<GetCategoryResponse, GetCategoryParams> {
  final CategoriesRepository repository;

  GetCategoryUseCase({required this.repository});

  @override
  Future<Either<Failure, GetCategoryResponse>> call(GetCategoryParams params) async {
    return await repository.getCategory(params: params);
  }
}


class GetCategoryParams extends Equatable {
  final int? id;

  const GetCategoryParams({
    required this.id,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
  };

  @override
  List<Object?> get props => <Object?>[
    id,
  ];

}




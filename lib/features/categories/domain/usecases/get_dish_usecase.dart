import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_dish_response.dart';
import '../repositories/categories_repo.dart';


class GetDishUseCase extends UseCase<GetDishResponse, GetDishParams> {
  final CategoriesRepository repository;

  GetDishUseCase({required this.repository});

  @override
  Future<Either<Failure, GetDishResponse>> call(GetDishParams params) async {
    return await repository.getDish(params: params);
  }
}


class GetDishParams extends Equatable {
  final int? id;

  const GetDishParams({
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




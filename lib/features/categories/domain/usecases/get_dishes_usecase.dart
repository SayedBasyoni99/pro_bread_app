import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_dishes_response.dart';
import '../repositories/categories_repo.dart';


class GetDishesUseCase extends UseCase<GetDishesResponse, GetDishesParams> {
  final CategoriesRepository repository;

  GetDishesUseCase({required this.repository});

  @override
  Future<Either<Failure, GetDishesResponse>> call(GetDishesParams params) async {
    return await repository.getDishes(params: params);
  }
}


class GetDishesParams extends Equatable {
  final String? keyword;
  final int? category;
  final int? sales;
  final int? rating;

  const GetDishesParams({
    required this.keyword,
    required this.category,
    required this.sales,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
    'keyword': keyword,
    'category': category,
    'sales': sales,
    'rating': rating,
  };

  @override
  List<Object?> get props => <Object?>[
    keyword,
    category,
    sales,
    rating,
  ];

}




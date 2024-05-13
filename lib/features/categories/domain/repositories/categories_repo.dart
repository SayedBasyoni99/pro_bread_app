import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/get_dish_response.dart';
import '../../domain/usecases/get_dish_usecase.dart';
import '../../domain/entities/get_dishes_response.dart';
import '../../domain/usecases/get_dishes_usecase.dart';
import '../../domain/entities/get_category_response.dart';
import '../../domain/usecases/get_category_usecase.dart';
import '../../domain/entities/get_categories_response.dart';
import '../../../../core/usecases/usecase.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, GetDishResponse>> getDish({
    required GetDishParams params,
  });


  Future<Either<Failure, GetDishesResponse>> getDishes({
    required GetDishesParams params,
  });


  Future<Either<Failure, GetCategoryResponse>> getCategory({
    required GetCategoryParams params,
  });


  Future<Either<Failure, GetCategoriesResponse>> getCategories({
    required NoParams params,
  });


}

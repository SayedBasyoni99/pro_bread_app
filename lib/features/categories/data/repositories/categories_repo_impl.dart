import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasources/categories_remote_datasource.dart';
import '../../domain/repositories/categories_repo.dart';
import '../../domain/entities/get_dish_response.dart';
import '../../domain/usecases/get_dish_usecase.dart';
import '../../domain/entities/get_dishes_response.dart';
import '../../domain/usecases/get_dishes_usecase.dart';
import '../../domain/entities/get_category_response.dart';
import '../../domain/usecases/get_category_usecase.dart';
import '../../domain/entities/get_categories_response.dart';
import '../../../../core/usecases/usecase.dart';


class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDataSource remote;

  CategoriesRepositoryImpl({
    required this.remote,
  });

  /// Impl
  @override
  Future<Either<Failure, GetDishResponse>> getDish({required GetDishParams params}) async {
    try {
      final GetDishResponse response = await remote.getDish(params: params);
        return Right<Failure, GetDishResponse>(response);
      } on AppException catch (error) {
        Log.e('[getDish] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetDishResponse>(error.toFailure());
      }
  }


  @override
  Future<Either<Failure, GetDishesResponse>> getDishes({required GetDishesParams params}) async {
    try {
      final GetDishesResponse response = await remote.getDishes(params: params);
        return Right<Failure, GetDishesResponse>(response);
      } on AppException catch (error) {
        Log.e('[getDishes] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetDishesResponse>(error.toFailure());
      }
  }


  @override
  Future<Either<Failure, GetCategoryResponse>> getCategory({required GetCategoryParams params}) async {
    try {
      final GetCategoryResponse response = await remote.getCategory(params: params);
        return Right<Failure, GetCategoryResponse>(response);
      } on AppException catch (error) {
        Log.e('[getCategory] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetCategoryResponse>(error.toFailure());
      }
  }


  @override
  Future<Either<Failure, GetCategoriesResponse>> getCategories({required NoParams params}) async {
    try {
      final GetCategoriesResponse response = await remote.getCategories();
        return Right<Failure, GetCategoriesResponse>(response);
      } on AppException catch (error) {
        Log.e('[getCategories] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetCategoriesResponse>(error.toFailure());
      }
  }


}


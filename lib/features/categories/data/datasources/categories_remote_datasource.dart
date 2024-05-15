import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../models/get_dish_model.dart';
import '../../domain/usecases/get_dish_usecase.dart';
import '../models/get_dishes_model.dart';
import '../../domain/usecases/get_dishes_usecase.dart';
import '../models/get_category_model.dart';
import '../../domain/usecases/get_category_usecase.dart';
import '../models/get_categories_model.dart';

abstract class CategoriesRemoteDataSource {
  Future<GetDishModel> getDish({
    required GetDishParams params,
  });

  Future<GetDishesModel> getDishes({
    required GetDishesParams params,
  });

  Future<GetCategoryModel> getCategory({
    required GetCategoryParams params,
  });

  Future<GetCategoriesModel> getCategories();

}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {

  @override
  Future<GetDishModel> getDish({
    required GetDishParams params,
  }) async {
    try {
      String getDishEndpoint = '/api/v1/dishes/${params.id}';
      final dynamic response = await dioConsumer.get(
        getDishEndpoint,
      );

      if(response['status'] == true){
        return GetDishModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<GetDishesModel> getDishes({
    required GetDishesParams params,
  }) async {
    try {
      const String getDishesEndpoint = '/api/v1/dishes';
      final dynamic response = await dioConsumer.get(
        getDishesEndpoint,
        queryParameters: params.toJson(),
      );

      if(response['status'] == true){
        return GetDishesModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<GetCategoryModel> getCategory({
    required GetCategoryParams params,
  }) async {
    try {
      String getCategoryEndpoint = '/api/v1/categories/${params.id}';
      final dynamic response = await dioConsumer.get(
        getCategoryEndpoint,
      );

      if(response['status'] == true){
        return GetCategoryModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<GetCategoriesModel> getCategories() async {
    try {
      const String getCategoriesEndpoint = '/api/v1/categories';
      final dynamic response = await dioConsumer.get(
        getCategoriesEndpoint,
      );

      if(response['status'] == true){
        return GetCategoriesModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

}

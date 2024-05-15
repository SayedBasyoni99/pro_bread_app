import '../../domain/entities/get_category_response.dart';
import '../../domain/entities/get_dish_response.dart';
import 'get_dish_model.dart';

class GetCategoryModel extends GetCategoryResponse {
  const GetCategoryModel({
    required super.data,
  });

  factory GetCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetCategoryModel(
        data: CategoryModel.fromJson(json['data']),
      );
}


class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.avatar,
    required super.dishes,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    name: json['name'] ?? '',
    avatar: json['avatar'] ?? '',
    dishes: json['dishes'] != null? (json['dishes'] as List<dynamic>).map((dynamic e) => DishModel.fromJson(e)).toList() : const <Dish>[],
  );

}





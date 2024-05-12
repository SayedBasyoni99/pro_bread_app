import '../../domain/entities/get_dish_response.dart';
import 'get_category_model.dart';

class GetDishModel extends GetDishResponse {
  const GetDishModel({
    required super.data,
  });

  factory GetDishModel.fromJson(Map<String, dynamic> json) =>
      GetDishModel(
        data: DishModel.fromJson(json['data']),
      );
}


class DishModel extends Dish {
  const DishModel({
    required super.id,
    required super.name,
    required super.description,
    required super.avatar,
    required super.price,
    required super.sales,
    required super.rating,
    required super.newDish,
    required super.time,
    required super.isFav,
    required super.category,
    required super.features,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) => DishModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    avatar: json['avatar'] ?? '',
    price: json['price'] ?? '',
    sales: json['sales'] != null? num.tryParse(json['sales'].toString())?.toInt()?? 0: 0,
    rating: json['rating'] != null? num.tryParse(json['rating'].toString())?.toInt()?? 0: 0,
    newDish: json['new_dish'] != null? num.tryParse(json['new_dish'].toString())?.toInt()?? 0: 0,
    time: json['time'] != null? num.tryParse(json['time'].toString())?.toInt()?? 0: 0,
    isFav: json['is_fav'] != null? json['is_fav'] as bool : false,
    category: json['category'] != null? CategoryModel.fromJson(json['category']) : null,
    features: json['features'] != null? (json['features'] as List<dynamic>).map((dynamic e) => DishFeatureModel.fromJson(e)).toList() : const <DishFeature>[],
  );

}


class DishFeatureModel extends DishFeature {
  const DishFeatureModel({
    required super.id,
    required super.name,
    required super.type,
    required super.data,
  });

  factory DishFeatureModel.fromJson(Map<String, dynamic> json) => DishFeatureModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    name: json['name'] ?? '',
    type: json['type'] != null? num.tryParse(json['type'].toString())?.toInt()?? 0: 0,
    data: json['data'] != null? (json['data'] as List<dynamic>).map((dynamic e) => DishFeatureDataModel.fromJson(e)).toList() : const <DishFeatureData>[],
  );

}


class DishFeatureDataModel extends DishFeatureData {
  const DishFeatureDataModel({
    required super.name,
    required super.price,
  });

  factory DishFeatureDataModel.fromJson(Map<String, dynamic> json) => DishFeatureDataModel(
    name: json['name'] ?? '',
    price: json['price'] ?? '',
  );

}




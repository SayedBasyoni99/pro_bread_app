import '../../domain/entities/get_dishes_response.dart';
import 'get_dish_model.dart';

class GetDishesModel extends GetDishesResponse {
  const GetDishesModel({
    required super.data,
  });

  factory GetDishesModel.fromJson(Map<String, dynamic> json) =>
      GetDishesModel(
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => DishModel.fromJson(e))
            .toList(),
      );
}





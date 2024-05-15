import '../../../categories/data/models/get_dish_model.dart';
import '../../domain/entities/get_favorites_response.dart';

class GetFavoritesModel extends GetFavoritesResponse {
  const GetFavoritesModel({
    required super.status,
    required super.data,
  });

  factory GetFavoritesModel.fromJson(Map<String, dynamic> json) =>
      GetFavoritesModel(
        status: json['status'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => DishModel.fromJson(e))
            .toList(),
      );
}



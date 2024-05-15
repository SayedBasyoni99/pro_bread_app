import '../../domain/entities/get_categories_response.dart';
import 'get_category_model.dart';

class GetCategoriesModel extends GetCategoriesResponse {
  const GetCategoriesModel({
    required super.data,
  });

  factory GetCategoriesModel.fromJson(Map<String, dynamic> json) =>
      GetCategoriesModel(
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => CategoryModel.fromJson(e))
            .toList(),
      );
}



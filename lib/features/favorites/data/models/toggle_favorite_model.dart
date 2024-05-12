import '../../domain/entities/toggle_favorite_response.dart';

class ToggleFavoriteModel extends ToggleFavoriteResponse {
  const ToggleFavoriteModel({
    required super.status,
    required super.message,
  });

  factory ToggleFavoriteModel.fromJson(Map<String, dynamic> json) =>
      ToggleFavoriteModel(
        status: json['status'],
        message: json['message'],
      );
}




import '../../domain/entities/update_password_response.dart';

class UpdatePasswordModel extends UpdatePasswordResponse {
  const UpdatePasswordModel({
    required super.statusCode,
    required super.message,
  });

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordModel(
        statusCode: json['status_code'],
        message: json['message'],
      );
}




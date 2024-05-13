import '../../domain/entities/forget_password_response.dart';

class ForgetPasswordModel extends ForgetPasswordResponse {
  const ForgetPasswordModel({
    required super.statusCode,
    required super.message,
  });

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordModel(
        statusCode: json['status_code'],
        message: json['message'],
      );
}




import '../../domain/entities/register_response.dart';

class RegisterModel extends RegisterResponse {
  const RegisterModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? json['data'] as int : null,
      );
}

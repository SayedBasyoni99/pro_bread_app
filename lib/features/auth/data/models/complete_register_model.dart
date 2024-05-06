import '../../domain/entities/complete_register_response.dart';

class CompleteRegisterModel extends CompleteRegisterResponse {
  const CompleteRegisterModel({
    required super.status,
    required super.message,
  });

  factory CompleteRegisterModel.fromJson(Map<String, dynamic> json) =>
      CompleteRegisterModel(
        status: json['status'],
        message: json['message'],
      );
}




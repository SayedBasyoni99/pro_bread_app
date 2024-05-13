import '../../domain/entities/send_otp_response.dart';

class SendOtpModel extends SendOtpResponse {
  const SendOtpModel({
    required super.status,
    required super.message,
    required super.data,
  });

  factory SendOtpModel.fromJson(Map<String, dynamic> json) =>
      SendOtpModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] as int,
      );
}




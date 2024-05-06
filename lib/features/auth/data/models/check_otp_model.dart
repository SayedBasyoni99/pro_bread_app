import '../../domain/entities/check_otp_response.dart';

class CheckOtpModel extends CheckOtpResponse {
  const CheckOtpModel({
    required super.status,
    required super.message,
  });

  factory CheckOtpModel.fromJson(Map<String, dynamic> json) =>
      CheckOtpModel(
        status: json['status'],
        message: json['message'],
      );
}




import '../../domain/entities/login_response.dart';

class LoginModel extends LoginResponse {
  const LoginModel({
    required super.status,
    required super.message,
    required super.accessToken,
    required super.tokenType,
    required super.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
        status: json['status'],
        message: json['message'],
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        data: UserModel.fromJson(json['data']),
      );
}


class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.wallet,
    required super.blocked,
    required super.verificationCode,
    required super.phoneVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.image,
    required super.otp,
    required super.verified,
    required super.fcmToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'] != null? num.tryParse(json['id'].toString())?.toInt()?? 0: 0,
    name: json['name'] ?? '',
    email: json['email'] ?? '',
    phone: json['phone'] ?? '',
    wallet: json['wallet'] != null? num.tryParse(json['wallet'].toString())?.toInt()?? 0: 0,
    blocked: json['blocked'] != null? num.tryParse(json['blocked'].toString())?.toInt()?? 0: 0,
    verificationCode: json['verification_code'] ?? '',
    phoneVerifiedAt: json['phone_verified_at'] ?? '',
    createdAt: json['created_at'] ?? '',
    updatedAt: json['updated_at'] ?? '',
    image: json['image'] ?? '',
    otp: json['otp'] ?? '',
    verified: json['verified'] != null? num.tryParse(json['verified'].toString())?.toInt()?? 0: 0,
    fcmToken: json['fcm_token'] ?? '',
  );

}




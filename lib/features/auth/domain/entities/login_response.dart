import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable{
  final int status;
  final String message;
  final String accessToken;
  final String tokenType;
  final User data;

  const LoginResponse({
    required this.status,
    required this.message,
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    message,
    accessToken,
    tokenType,
    data,
  ];
}


class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final int wallet;
  final int blocked;
  final String verificationCode;
  final String phoneVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String image;
  final String otp;
  final int verified;
  final String fcmToken;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.wallet,
    required this.blocked,
    required this.verificationCode,
    required this.phoneVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
    required this.otp,
    required this.verified,
    required this.fcmToken,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    int? wallet,
    int? blocked,
    String? verificationCode,
    String? phoneVerifiedAt,
    String? createdAt,
    String? updatedAt,
    String? image,
    String? otp,
    int? verified,
    String? fcmToken,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      wallet: wallet ?? this.wallet,
      blocked: blocked ?? this.blocked,
      verificationCode: verificationCode ?? this.verificationCode,
      phoneVerifiedAt: phoneVerifiedAt ?? this.phoneVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      image: image ?? this.image,
      otp: otp ?? this.otp,
      verified: verified ?? this.verified,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    name,
    email,
    phone,
    wallet,
    blocked,
    verificationCode,
    phoneVerifiedAt,
    createdAt,
    updatedAt,
    image,
    otp,
    verified,
    fcmToken,
  ];

}



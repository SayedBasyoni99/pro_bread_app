import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/check_otp_response.dart';
import '../repositories/auth_repo.dart';


class CheckOtpUseCase extends UseCase<CheckOtpResponse, CheckOtpParams> {
  final AuthRepository repository;

  CheckOtpUseCase({required this.repository});

  @override
  Future<Either<Failure, CheckOtpResponse>> call(CheckOtpParams params) async {
    return await repository.checkOtp(params: params);
  }
}


class CheckOtpParams extends Equatable {
  final String? phone;
  final String? otp;
  final String? address;
  final String? street;
  final String? city;
  final String? note;
  final int? defaultKey;

  const CheckOtpParams({
    required this.phone,
    required this.otp,
    required this.address,
    required this.street,
    required this.city,
    required this.note,
    required this.defaultKey,
  });

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'otp': otp,
    'address': address,
    'street': street,
    'city': city,
    'note': note,
    'default': defaultKey,
  };

  @override
  List<Object?> get props => <Object?>[
    phone,
    otp,
    address,
    street,
    city,
    note,
    defaultKey,
  ];

}




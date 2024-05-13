import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/send_otp_response.dart';
import '../repositories/auth_repo.dart';


class SendOtpUseCase extends UseCase<SendOtpResponse, SendOtpParams> {
  final AuthRepository repository;

  SendOtpUseCase({required this.repository});

  @override
  Future<Either<Failure, SendOtpResponse>> call(SendOtpParams params) async {
    return await repository.sendOtp(params: params);
  }
}


class SendOtpParams extends Equatable {
  final String? phone;

  const SendOtpParams({
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
    'phone': phone,
  };

  @override
  List<Object?> get props => <Object?>[
    phone,
  ];

}




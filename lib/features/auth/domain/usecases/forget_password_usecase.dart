import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/forget_password_response.dart';
import '../repositories/auth_repo.dart';


class ForgetPasswordUseCase extends UseCase<ForgetPasswordResponse, ForgetPasswordParams> {
  final AuthRepository repository;

  ForgetPasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, ForgetPasswordResponse>> call(ForgetPasswordParams params) async {
    return await repository.forgetPassword(params: params);
  }
}


class ForgetPasswordParams extends Equatable {
  final String? phone;
  final String? password;

  const ForgetPasswordParams({
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'password': password,
  };

  @override
  List<Object?> get props => <Object?>[
    phone,
    password,
  ];

}




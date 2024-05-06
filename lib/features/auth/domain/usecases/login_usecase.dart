import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_response.dart';
import '../repositories/auth_repo.dart';


class LoginUseCase extends UseCase<LoginResponse, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, LoginResponse>> call(LoginParams params) async {
    return await repository.login(params: params);
  }
}


class LoginParams extends Equatable {
  final String? phone;
  final String? password;

  const LoginParams({
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




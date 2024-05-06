import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/complete_register_response.dart';
import '../repositories/auth_repo.dart';


class CompleteRegisterUseCase extends UseCase<CompleteRegisterResponse, CompleteRegisterParams> {
  final AuthRepository repository;

  CompleteRegisterUseCase({required this.repository});

  @override
  Future<Either<Failure, CompleteRegisterResponse>> call(CompleteRegisterParams params) async {
    return await repository.completeRegister(params: params);
  }
}


class CompleteRegisterParams extends Equatable {
  final String? name;
  final String? phone;
  final String? password;

  const CompleteRegisterParams({
    required this.name,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'password': password,
  };

  @override
  List<Object?> get props => <Object?>[
    name,
    phone,
    password,
  ];

}




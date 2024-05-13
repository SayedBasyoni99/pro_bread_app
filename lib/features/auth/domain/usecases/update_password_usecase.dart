import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/update_password_response.dart';
import '../repositories/auth_repo.dart';


class UpdatePasswordUseCase extends UseCase<UpdatePasswordResponse, UpdatePasswordParams> {
  final AuthRepository repository;

  UpdatePasswordUseCase({required this.repository});

  @override
  Future<Either<Failure, UpdatePasswordResponse>> call(UpdatePasswordParams params) async {
    return await repository.updatePassword(params: params);
  }
}


class UpdatePasswordParams extends Equatable {
  final String? password;
  final String? newPassword;

  const UpdatePasswordParams({
    required this.password,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() => {
    'password': password,
    'new_password': newPassword,
  };

  @override
  List<Object?> get props => <Object?>[
    password,
    newPassword,
  ];

}




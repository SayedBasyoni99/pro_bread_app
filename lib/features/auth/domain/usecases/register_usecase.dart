import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/register_response.dart';
import '../repositories/auth_repo.dart';


class RegisterUseCase extends UseCase<RegisterResponse, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  @override
  Future<Either<Failure, RegisterResponse>> call(RegisterParams params) async {
    return await repository.register(params: params);
  }
}


class RegisterParams extends Equatable {
  final String? phone;
  final String? street;
  final String? city;
  final String? note;
  final int? defaultKey;

  const RegisterParams({
    required this.phone,
    required this.street,
    required this.city,
    required this.note,
    required this.defaultKey,
  });

  Map<String, dynamic> toJson() => {
    'phone': phone,
    'street': street,
    'city': city,
    'note': note,
    'default': defaultKey,
  };

  @override
  List<Object?> get props => <Object?>[
    phone,
    street,
    city,
    note,
    defaultKey,
  ];

}




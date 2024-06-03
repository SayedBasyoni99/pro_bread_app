import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repo.dart';


class SaveAccessTokenUseCase extends UseCase<bool, SaveAccessTokenParams> {
  final AuthRepository repository;

  SaveAccessTokenUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(SaveAccessTokenParams params) async {
    return await repository.saveAccessToken(params: params);
  }
}


class SaveAccessTokenParams extends Equatable {
  final String token;

  const SaveAccessTokenParams({
    required this.token,
  });

  @override
  List<Object?> get props => <Object?>[
    token,
  ];

}




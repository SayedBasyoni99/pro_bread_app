import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repo.dart';


class RemoveAccessTokenUseCase extends UseCase<bool, NoParams> {
  final AuthRepository repository;

  RemoveAccessTokenUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.removeAccessToken(params: params);
  }
}




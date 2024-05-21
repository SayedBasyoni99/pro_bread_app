import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/lang_repository.dart';

class ChangeLangUseCase implements UseCase<void, String> {
  final LangRepository repository;

  ChangeLangUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String langCode) async =>
      await repository.changeLang(langCode: langCode);
}

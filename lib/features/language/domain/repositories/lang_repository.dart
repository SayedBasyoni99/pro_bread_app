import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class LangRepository {
  Future<Either<Failure, void>> changeLang({required String langCode});
  Future<Either<Failure, String>> getSavedLang();
}

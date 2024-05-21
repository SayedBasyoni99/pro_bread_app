import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/log_utils.dart';
import '../../domain/repositories/lang_repository.dart';
import '../datasources/lang_local_data_source.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl(
      {required this.langLocalDataSource});

  @override
  Future<Either<Failure, void>> changeLang({required String langCode}) async {
    try {
      final langIsChanged = await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on AppException catch (error) {
      Log.e('[changeLang] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, bool>(error.toFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on AppException catch (error) {
      Log.e('[getSavedLang] [${error.runtimeType.toString()}] ---- ${error.message}');
      return Left<Failure, String>(error.toFailure());
    }
  }
}

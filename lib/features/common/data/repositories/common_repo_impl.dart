import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasources/common_remote_datasource.dart';
import '../../domain/repositories/common_repo.dart';
import '../../domain/entities/send_gift_response.dart';
import '../../domain/usecases/send_gift_usecase.dart';


class CommonRepositoryImpl implements CommonRepository {
  final CommonRemoteDataSource remote;

  CommonRepositoryImpl({
    required this.remote,
  });

  /// Impl
  @override
  Future<Either<Failure, SendGiftResponse>> sendGift({required SendGiftParams params}) async {
    try {
      final SendGiftResponse response = await remote.sendGift(params: params);
        return Right<Failure, SendGiftResponse>(response);
      } on AppException catch (error) {
        Log.e('[sendGift] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, SendGiftResponse>(error.toFailure());
      }
  }


}


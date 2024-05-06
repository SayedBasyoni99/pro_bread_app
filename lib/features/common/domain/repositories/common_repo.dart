import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/send_gift_response.dart';
import '../../domain/usecases/send_gift_usecase.dart';

abstract class CommonRepository {
  Future<Either<Failure, SendGiftResponse>> sendGift({
    required SendGiftParams params,
  });


}

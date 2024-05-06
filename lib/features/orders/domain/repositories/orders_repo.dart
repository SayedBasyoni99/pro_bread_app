import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/get_delivery_hours_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/update_order_delivery_time_response.dart';
import '../../domain/usecases/update_order_delivery_time_usecase.dart';
import '../../domain/entities/follow_order_response.dart';
import '../../domain/usecases/follow_order_usecase.dart';

abstract class OrdersRepository {
  Future<Either<Failure, GetDeliveryHoursResponse>> getDeliveryHours({
    required NoParams params,
  });


  Future<Either<Failure, UpdateOrderDeliveryTimeResponse>> updateOrderDeliveryTime({
    required UpdateOrderDeliveryTimeParams params,
  });


  Future<Either<Failure, FollowOrderResponse>> followOrder({
    required FollowOrderParams params,
  });


}

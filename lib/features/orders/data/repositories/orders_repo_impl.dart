import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasources/orders_remote_datasource.dart';
import '../../domain/repositories/orders_repo.dart';
import '../../domain/entities/get_delivery_hours_response.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/update_order_delivery_time_response.dart';
import '../../domain/usecases/update_order_delivery_time_usecase.dart';
import '../../domain/entities/follow_order_response.dart';
import '../../domain/usecases/follow_order_usecase.dart';


class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remote;

  OrdersRepositoryImpl({
    required this.remote,
  });

  /// Impl
  @override
  Future<Either<Failure, GetDeliveryHoursResponse>> getDeliveryHours({required NoParams params}) async {
    try {
      final GetDeliveryHoursResponse response = await remote.getDeliveryHours();
        return Right<Failure, GetDeliveryHoursResponse>(response);
      } on AppException catch (error) {
        Log.e('[getDeliveryHours] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, GetDeliveryHoursResponse>(error.toFailure());
      }
  }


  @override
  Future<Either<Failure, UpdateOrderDeliveryTimeResponse>> updateOrderDeliveryTime({required UpdateOrderDeliveryTimeParams params}) async {
    try {
      final UpdateOrderDeliveryTimeResponse response = await remote.updateOrderDeliveryTime(params: params);
        return Right<Failure, UpdateOrderDeliveryTimeResponse>(response);
      } on AppException catch (error) {
        Log.e('[updateOrderDeliveryTime] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, UpdateOrderDeliveryTimeResponse>(error.toFailure());
      }
  }


  @override
  Future<Either<Failure, FollowOrderResponse>> followOrder({required FollowOrderParams params}) async {
    try {
      final FollowOrderResponse response = await remote.followOrder(params: params);
        return Right<Failure, FollowOrderResponse>(response);
      } on AppException catch (error) {
        Log.e('[followOrder] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, FollowOrderResponse>(error.toFailure());
      }
  }


}


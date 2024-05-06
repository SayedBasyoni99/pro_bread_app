import '../../../../core/error/exceptions.dart';
import '../../../../injection_container.dart';
import '../../../../core/api/dio_consumer.dart';
import '../models/get_delivery_hours_model.dart';
import '../models/update_order_delivery_time_model.dart';
import '../../domain/usecases/update_order_delivery_time_usecase.dart';
import '../models/follow_order_model.dart';
import '../../domain/usecases/follow_order_usecase.dart';

abstract class OrdersRemoteDataSource {
  Future<GetDeliveryHoursModel> getDeliveryHours();

  Future<UpdateOrderDeliveryTimeModel> updateOrderDeliveryTime({
    required UpdateOrderDeliveryTimeParams params,
  });

  Future<FollowOrderModel> followOrder({
    required FollowOrderParams params,
  });

}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {

  @override
  Future<GetDeliveryHoursModel> getDeliveryHours() async {
    try {
      const String getDeliveryHoursEndpoint = '/api/v1/delivery-hours';
      final dynamic response = await dioConsumer.get(
        getDeliveryHoursEndpoint,
      );

      if(response['success'] == true){
        return GetDeliveryHoursModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<UpdateOrderDeliveryTimeModel> updateOrderDeliveryTime({
    required UpdateOrderDeliveryTimeParams params,
  }) async {
    try {
      const String updateOrderDeliveryTimeEndpoint = '/api/v1/order-delivery-time';
      final dynamic response = await dioConsumer.post(
        updateOrderDeliveryTimeEndpoint,
        body: params.toJson(),
      );

      if(response['success'] == true){
        return UpdateOrderDeliveryTimeModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }


  @override
  Future<FollowOrderModel> followOrder({
    required FollowOrderParams params,
  }) async {
    try {
      const String followOrderEndpoint = '/api/v1/follow-order';
      final dynamic response = await dioConsumer.get(
        followOrderEndpoint,
      );

      if(response['success'] == true){
        return FollowOrderModel.fromJson(response);
      }
      throw ServerException(message: response['message']?? '');
    } catch (error) {
      rethrow;
    }
  }

}

import '../../domain/entities/update_order_delivery_time_response.dart';

class UpdateOrderDeliveryTimeModel extends UpdateOrderDeliveryTimeResponse {
  const UpdateOrderDeliveryTimeModel({
    required super.message,
    required super.status,
  });

  factory UpdateOrderDeliveryTimeModel.fromJson(Map<String, dynamic> json) =>
      UpdateOrderDeliveryTimeModel(
        message: json['message'],
        status: json['status'],
      );
}




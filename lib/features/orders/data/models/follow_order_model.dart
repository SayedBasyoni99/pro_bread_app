import '../../domain/entities/follow_order_response.dart';

class FollowOrderModel extends FollowOrderResponse {
  const FollowOrderModel({
    required super.status,
    required super.data,
  });

  factory FollowOrderModel.fromJson(Map<String, dynamic> json) =>
      FollowOrderModel(
        status: json['status'],
        data: OrderModel.fromJson(json['data']),
      );
}

class OrderModel extends Order {
  const OrderModel({
    required super.orderId,
    required super.inProcess,
    required super.outForDelivery,
    required super.received,
    required super.address,
    required super.orderTotal,
    required super.deliveryFee,
    required super.tax,
    required super.discount,
    required super.net,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        orderId: json['order_id'] != null
            ? num.tryParse(json['order_id'].toString())?.toInt() ?? 0
            : 0,
        inProcess: json['in_process'] ?? '',
        outForDelivery: json['out_for_delivery'] ?? '',
        received: json['received'] ?? '',
        address: json['address'] ?? '',
        orderTotal: json['order_total'] != null
            ? num.tryParse(json['order_total'].toString())?.toDouble() ?? 0.0
            : 0.0,
        deliveryFee: json['delivery_fee'] != null
            ? num.tryParse(json['delivery_fee'].toString())?.toDouble() ?? 0.0
            : 0.0,
        tax: json['tax'] != null
            ? num.tryParse(json['tax'].toString())?.toDouble() ?? 0.0
            : 0.0,
        discount: json['discount'] != null
            ? num.tryParse(json['discount'].toString())?.toDouble() ?? 0.0
            : 0.0,
        net: json['net'] != null
            ? num.tryParse(json['net'].toString())?.toDouble() ?? 0.0
            : 0.0,
      );
}

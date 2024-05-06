import 'package:equatable/equatable.dart';

class FollowOrderResponse extends Equatable{
  final int status;
  final Order data;

  const FollowOrderResponse({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    data,
  ];
}


class Order extends Equatable {
  final int orderId;
  final String inProcess;
  final String outForDelivery;
  final String received;
  final String address;
  final double orderTotal;
  final double deliveryFee;
  final double tax;
  final double discount;
  final double net;

  const Order({
    required this.orderId,
    required this.inProcess,
    required this.outForDelivery,
    required this.received,
    required this.address,
    required this.orderTotal,
    required this.deliveryFee,
    required this.tax,
    required this.discount,
    required this.net,
  });

  Order copyWith({
    int? orderId,
    String? inProcess,
    String? outForDelivery,
    String? received,
    String? address,
    double? orderTotal,
    double? deliveryFee,
    double? tax,
    double? discount,
    double? net,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      inProcess: inProcess ?? this.inProcess,
      outForDelivery: outForDelivery ?? this.outForDelivery,
      received: received ?? this.received,
      address: address ?? this.address,
      orderTotal: orderTotal ?? this.orderTotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      net: net ?? this.net,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    orderId,
    inProcess,
    outForDelivery,
    received,
    address,
    orderTotal,
    deliveryFee,
    tax,
    discount,
    net,
  ];

}



import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/update_order_delivery_time_response.dart';
import '../repositories/orders_repo.dart';


class UpdateOrderDeliveryTimeUseCase extends UseCase<UpdateOrderDeliveryTimeResponse, UpdateOrderDeliveryTimeParams> {
  final OrdersRepository repository;

  UpdateOrderDeliveryTimeUseCase({required this.repository});

  @override
  Future<Either<Failure, UpdateOrderDeliveryTimeResponse>> call(UpdateOrderDeliveryTimeParams params) async {
    return await repository.updateOrderDeliveryTime(params: params);
  }
}


class UpdateOrderDeliveryTimeParams extends Equatable {
  final String? day;
  final String? time;
  final int? orderId;

  const UpdateOrderDeliveryTimeParams({
    required this.day,
    required this.time,
    required this.orderId,
  });

  Map<String, dynamic> toJson() => {
    'day': day,
    'time': time,
    'order_id': orderId,
  };

  @override
  List<Object?> get props => <Object?>[
    day,
    time,
    orderId,
  ];

}




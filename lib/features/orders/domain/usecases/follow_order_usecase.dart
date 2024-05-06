import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/follow_order_response.dart';
import '../repositories/orders_repo.dart';


class FollowOrderUseCase extends UseCase<FollowOrderResponse, FollowOrderParams> {
  final OrdersRepository repository;

  FollowOrderUseCase({required this.repository});

  @override
  Future<Either<Failure, FollowOrderResponse>> call(FollowOrderParams params) async {
    return await repository.followOrder(params: params);
  }
}


class FollowOrderParams extends Equatable {
  final int? orderId;

  const FollowOrderParams({
    required this.orderId,
  });

  Map<String, dynamic> toJson() => {
    'order_id': orderId,
  };

  @override
  List<Object?> get props => <Object?>[
    orderId,
  ];

}




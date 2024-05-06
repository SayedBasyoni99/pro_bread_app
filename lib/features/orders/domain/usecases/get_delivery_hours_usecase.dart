import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_delivery_hours_response.dart';
import '../repositories/orders_repo.dart';


class GetDeliveryHoursUseCase extends UseCase<GetDeliveryHoursResponse, NoParams> {
  final OrdersRepository repository;

  GetDeliveryHoursUseCase({required this.repository});

  @override
  Future<Either<Failure, GetDeliveryHoursResponse>> call(NoParams params) async {
    return await repository.getDeliveryHours(params: params);
  }
}




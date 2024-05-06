import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/update_order_delivery_time_usecase.dart';
import '../../../domain/entities/update_order_delivery_time_response.dart';

part 'update_order_delivery_time_states.dart';

class UpdateOrderDeliveryTimeCubit extends Cubit<UpdateOrderDeliveryTimeState> {
  final UpdateOrderDeliveryTimeUseCase updateOrderDeliveryTimeUseCase;

  UpdateOrderDeliveryTimeCubit(this.updateOrderDeliveryTimeUseCase) : super(const UpdateOrderDeliveryTimeInitialState());


  Future<void> fUpdateOrderDeliveryTime({
   required String day,
   required String time,
   required int orderId,
  }) async {
    emit(const UpdateOrderDeliveryTimeLoadingState());
    final Either<Failure, UpdateOrderDeliveryTimeResponse> eitherResult = await updateOrderDeliveryTimeUseCase(UpdateOrderDeliveryTimeParams(
      day: day,
      time: time,
      orderId: orderId,
    ));
    eitherResult.fold((Failure failure) {
      emit(UpdateOrderDeliveryTimeErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (UpdateOrderDeliveryTimeResponse response) {
      emit(const UpdateOrderDeliveryTimeSuccessState());
    });
  }
}


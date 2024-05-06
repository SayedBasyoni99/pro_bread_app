import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/follow_order_usecase.dart';
import '../../../domain/entities/follow_order_response.dart' as order_data;

part 'follow_order_states.dart';

class FollowOrderCubit extends Cubit<FollowOrderState> {
  final FollowOrderUseCase followOrderUseCase;

  FollowOrderCubit(this.followOrderUseCase) : super(const FollowOrderInitialState());

  order_data.Order? data;

  Future<void> fFollowOrder({
   required int orderId,
  }) async {
    emit(const FollowOrderLoadingState());
    final Either<Failure, order_data.FollowOrderResponse> eitherResult = await followOrderUseCase(FollowOrderParams(
      orderId: orderId,
    ));
    eitherResult.fold((Failure failure) {
      emit(FollowOrderErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (order_data.FollowOrderResponse response) {
      data = response.data;
      emit(FollowOrderSuccessState(value: response.data));
    });
  }
}


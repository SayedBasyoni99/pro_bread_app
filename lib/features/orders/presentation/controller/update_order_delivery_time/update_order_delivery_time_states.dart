part of 'update_order_delivery_time_cubit.dart';


abstract class UpdateOrderDeliveryTimeState extends Equatable {

  const UpdateOrderDeliveryTimeState();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdateOrderDeliveryTimeInitialState extends UpdateOrderDeliveryTimeState {
  const UpdateOrderDeliveryTimeInitialState();
}

class UpdateOrderDeliveryTimeLoadingState extends UpdateOrderDeliveryTimeState {
  const UpdateOrderDeliveryTimeLoadingState();
}

class UpdateOrderDeliveryTimeSuccessState extends UpdateOrderDeliveryTimeState {
  const UpdateOrderDeliveryTimeSuccessState();

}

class UpdateOrderDeliveryTimeErrorState extends UpdateOrderDeliveryTimeState {
  final String message;

  const UpdateOrderDeliveryTimeErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


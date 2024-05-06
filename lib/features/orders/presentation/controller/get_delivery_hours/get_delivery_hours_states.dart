part of 'get_delivery_hours_cubit.dart';


abstract class GetDeliveryHoursState extends Equatable {

  const GetDeliveryHoursState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetDeliveryHoursInitialState extends GetDeliveryHoursState {
  const GetDeliveryHoursInitialState();
}

class GetDeliveryHoursLoadingState extends GetDeliveryHoursState {
  const GetDeliveryHoursLoadingState();
}

class GetDeliveryHoursSuccessState extends GetDeliveryHoursState {
  final List<DeliveryHourData> value;

  const GetDeliveryHoursSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetDeliveryHoursErrorState extends GetDeliveryHoursState {
  final String message;

  const GetDeliveryHoursErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


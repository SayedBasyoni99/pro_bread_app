part of 'follow_order_cubit.dart';

abstract class FollowOrderState extends Equatable {

  const FollowOrderState();

  @override
  List<Object?> get props => <Object?>[];
}

class FollowOrderInitialState extends FollowOrderState {
  const FollowOrderInitialState();
}

class FollowOrderLoadingState extends FollowOrderState {
  const FollowOrderLoadingState();
}

class FollowOrderSuccessState extends FollowOrderState {
  final order_data.Order? value;

  const FollowOrderSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class FollowOrderErrorState extends FollowOrderState {
  final String message;

  const FollowOrderErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


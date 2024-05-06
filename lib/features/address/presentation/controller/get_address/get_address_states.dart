part of 'get_address_cubit.dart';


abstract class GetAddressState extends Equatable {

  const GetAddressState();

  @override
  List<Object?> get props => <Object?>[];
}

class GetAddressInitialState extends GetAddressState {
  const GetAddressInitialState();
}

class GetAddressLoadingState extends GetAddressState {
  const GetAddressLoadingState();
}

class GetAddressSuccessState extends GetAddressState {
  final Address? value;

  const GetAddressSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class GetAddressErrorState extends GetAddressState {
  final String message;

  const GetAddressErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


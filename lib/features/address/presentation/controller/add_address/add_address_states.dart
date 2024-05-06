part of 'add_address_cubit.dart';


abstract class AddAddressState extends Equatable {

  const AddAddressState();

  @override
  List<Object?> get props => <Object?>[];
}

class AddAddressInitialState extends AddAddressState {
  const AddAddressInitialState();
}

class AddAddressLoadingState extends AddAddressState {
  const AddAddressLoadingState();
}

class AddAddressSuccessState extends AddAddressState {
  const AddAddressSuccessState();

}

class AddAddressErrorState extends AddAddressState {
  final String message;

  const AddAddressErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


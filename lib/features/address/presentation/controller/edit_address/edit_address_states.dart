part of 'edit_address_cubit.dart';


abstract class EditAddressState extends Equatable {

  const EditAddressState();

  @override
  List<Object?> get props => <Object?>[];
}

class EditAddressInitialState extends EditAddressState {
  const EditAddressInitialState();
}

class EditAddressLoadingState extends EditAddressState {
  const EditAddressLoadingState();
}

class EditAddressSuccessState extends EditAddressState {
  const EditAddressSuccessState();

}

class EditAddressErrorState extends EditAddressState {
  final String message;

  const EditAddressErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


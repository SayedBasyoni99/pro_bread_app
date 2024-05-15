part of 'update_password_cubit.dart';


abstract class UpdatePasswordState extends Equatable {

  const UpdatePasswordState();

  @override
  List<Object?> get props => <Object?>[];
}

class UpdatePasswordInitialState extends UpdatePasswordState {
  const UpdatePasswordInitialState();
}

class UpdatePasswordLoadingState extends UpdatePasswordState {
  const UpdatePasswordLoadingState();
}

class UpdatePasswordSuccessState extends UpdatePasswordState {
  const UpdatePasswordSuccessState();

}

class UpdatePasswordErrorState extends UpdatePasswordState {
  final String message;

  const UpdatePasswordErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


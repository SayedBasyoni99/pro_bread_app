part of 'forget_password_cubit.dart';


abstract class ForgetPasswordState extends Equatable {

  const ForgetPasswordState();

  @override
  List<Object?> get props => <Object?>[];
}

class ForgetPasswordInitialState extends ForgetPasswordState {
  const ForgetPasswordInitialState();
}

class ForgetPasswordLoadingState extends ForgetPasswordState {
  const ForgetPasswordLoadingState();
}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  const ForgetPasswordSuccessState();

}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String message;

  const ForgetPasswordErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


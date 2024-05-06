part of 'login_cubit.dart';


abstract class LoginState extends Equatable {

  const LoginState();

  @override
  List<Object?> get props => <Object?>[];
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginSuccessState extends LoginState {
  final User? value;

  const LoginSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


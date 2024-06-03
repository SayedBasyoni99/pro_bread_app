part of 'auto_login_cubit.dart';

abstract class AutoLoginState extends Equatable {

  const AutoLoginState();

  @override
  List<Object?> get props => <Object?>[];
}

class AutoLoginInitialState extends AutoLoginState {
  const AutoLoginInitialState();
}

class AutoLoginSuccessState extends AutoLoginState{
  final UserType userType;

  const AutoLoginSuccessState({
    this.userType = UserType.firstOpen,
  });

    @override
  List<Object?> get props => <Object?>[userType];
}

class AutoLoginErrorState extends AutoLoginState{
  final String message;

  const AutoLoginErrorState({
    required this.message,
  });

    @override
  List<Object?> get props => <Object?>[message];
}

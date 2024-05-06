part of 'complete_register_cubit.dart';


abstract class CompleteRegisterState extends Equatable {

  const CompleteRegisterState();

  @override
  List<Object?> get props => <Object?>[];
}

class CompleteRegisterInitialState extends CompleteRegisterState {
  const CompleteRegisterInitialState();
}

class CompleteRegisterLoadingState extends CompleteRegisterState {
  const CompleteRegisterLoadingState();
}

class CompleteRegisterSuccessState extends CompleteRegisterState {
  const CompleteRegisterSuccessState();

}

class CompleteRegisterErrorState extends CompleteRegisterState {
  final String message;

  const CompleteRegisterErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


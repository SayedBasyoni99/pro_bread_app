part of 'check_otp_cubit.dart';


abstract class CheckOtpState extends Equatable {

  const CheckOtpState();

  @override
  List<Object?> get props => <Object?>[];
}

class CheckOtpInitialState extends CheckOtpState {
  const CheckOtpInitialState();
}

class CheckOtpLoadingState extends CheckOtpState {
  const CheckOtpLoadingState();
}

class CheckOtpSuccessState extends CheckOtpState {
  const CheckOtpSuccessState();

}

class CheckOtpErrorState extends CheckOtpState {
  final String message;

  const CheckOtpErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


part of 'send_otp_cubit.dart';


abstract class SendOtpState extends Equatable {

  const SendOtpState();

  @override
  List<Object?> get props => <Object?>[];
}

class SendOtpInitialState extends SendOtpState {
  const SendOtpInitialState();
}

class SendOtpLoadingState extends SendOtpState {
  const SendOtpLoadingState();
}

class SendOtpSuccessState extends SendOtpState {
  final int? value;

  const SendOtpSuccessState({required this.value});

  @override
  List<Object?> get props => <Object?>[value];
}

class SendOtpErrorState extends SendOtpState {
  final String message;

  const SendOtpErrorState({required this.message,});

  @override
  List<Object?> get props => <Object?>[message];
}


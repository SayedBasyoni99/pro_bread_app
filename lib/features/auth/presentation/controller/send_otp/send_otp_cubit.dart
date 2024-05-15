import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/send_otp_usecase.dart';
import '../../../domain/entities/send_otp_response.dart';

part 'send_otp_states.dart';

class SendOtpCubit extends Cubit<SendOtpState> {
  final SendOtpUseCase sendOtpUseCase;

  SendOtpCubit(this.sendOtpUseCase) : super(const SendOtpInitialState());

  int? data;

  Future<void> fSendOtp({
   required String phone,
  }) async {
    emit(const SendOtpLoadingState());
    final Either<Failure, SendOtpResponse> eitherResult = await sendOtpUseCase(SendOtpParams(
      phone: phone,
    ));
    eitherResult.fold((Failure failure) {
      emit(SendOtpErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (SendOtpResponse response) {
      data = response.data;
      emit(SendOtpSuccessState(value: response.data));
    });
  }
}


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/check_otp_usecase.dart';
import '../../../domain/entities/check_otp_response.dart';

part 'check_otp_states.dart';

class CheckOtpCubit extends Cubit<CheckOtpState> {
  final CheckOtpUseCase checkOtpUseCase;

  CheckOtpCubit(this.checkOtpUseCase) : super(const CheckOtpInitialState());


  Future<void> fCheckOtp({
   required String phone,
   required String otp,
   String? address,
   String? street,
   String? city,
   String? note,
   int? defaultKey,
  }) async {
    emit(const CheckOtpLoadingState());
    final Either<Failure, CheckOtpResponse> eitherResult = await checkOtpUseCase(CheckOtpParams(
      phone: phone,
      otp: otp,
      address: address,
      street: street,
      city: city,
      note: note,
      defaultKey: defaultKey,
    ));
    eitherResult.fold((Failure failure) {
      emit(CheckOtpErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (CheckOtpResponse response) {
      emit(const CheckOtpSuccessState());
    });
  }
}


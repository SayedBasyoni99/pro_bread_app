import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/forget_password_usecase.dart';
import '../../../domain/entities/forget_password_response.dart';

part 'forget_password_states.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordCubit(this.forgetPasswordUseCase) : super(const ForgetPasswordInitialState());


  Future<void> fForgetPassword({
   required String phone,
   required String password,
  }) async {
    emit(const ForgetPasswordLoadingState());
    final Either<Failure, ForgetPasswordResponse> eitherResult = await forgetPasswordUseCase(ForgetPasswordParams(
      phone: phone,
      password: password,
    ));
    eitherResult.fold((Failure failure) {
      emit(ForgetPasswordErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (ForgetPasswordResponse response) {
      emit(const ForgetPasswordSuccessState());
    });
  }
}


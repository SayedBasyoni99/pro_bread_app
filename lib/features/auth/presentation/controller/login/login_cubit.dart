import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/entities/login_response.dart';

part 'login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginInitialState());

  LoginResponse? data;

  Future<void> fLogin({
   required String phone,
   required String password,
  }) async {
    emit(const LoginLoadingState());
    final Either<Failure, LoginResponse> eitherResult = await loginUseCase(LoginParams(
      phone: phone,
      password: password,
    ));
    eitherResult.fold((Failure failure) {
      emit(LoginErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (LoginResponse response) {
      data = response;
      emit(LoginSuccessState(value: response.data));
    });
  }
}


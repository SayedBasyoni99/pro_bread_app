import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/register_usecase.dart';
import '../../../domain/entities/register_response.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(const RegisterInitialState());

  int? data;

  Future<void> fRegister({
   required String phone,
   required String street,
   required String city,
   required String note,
   required int defaultKey,
  }) async {
    emit(const RegisterLoadingState());
    final Either<Failure, RegisterResponse> eitherResult = await registerUseCase(RegisterParams(
      phone: phone,
      street: street,
      city: city,
      note: note,
      defaultKey: defaultKey,
    ));
    eitherResult.fold((Failure failure) {
      emit(RegisterErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (RegisterResponse response) {
      data = response.data;
      emit(RegisterSuccessState(value: response.data));
    });
  }
}


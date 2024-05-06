import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/complete_register_usecase.dart';
import '../../../domain/entities/complete_register_response.dart';

part 'complete_register_states.dart';

class CompleteRegisterCubit extends Cubit<CompleteRegisterState> {
  final CompleteRegisterUseCase completeRegisterUseCase;

  CompleteRegisterCubit(this.completeRegisterUseCase) : super(const CompleteRegisterInitialState());


  Future<void> fCompleteRegister({
   required String name,
   required String phone,
   required String password,
  }) async {
    emit(const CompleteRegisterLoadingState());
    final Either<Failure, CompleteRegisterResponse> eitherResult = await completeRegisterUseCase(CompleteRegisterParams(
      name: name,
      phone: phone,
      password: password,
    ));
    eitherResult.fold((Failure failure) {
      emit(CompleteRegisterErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (CompleteRegisterResponse response) {
      emit(const CompleteRegisterSuccessState());
    });
  }
}


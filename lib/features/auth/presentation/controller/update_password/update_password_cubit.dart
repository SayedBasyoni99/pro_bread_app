import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/update_password_usecase.dart';
import '../../../domain/entities/update_password_response.dart';

part 'update_password_states.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  final UpdatePasswordUseCase updatePasswordUseCase;

  UpdatePasswordCubit(this.updatePasswordUseCase) : super(const UpdatePasswordInitialState());


  Future<void> fUpdatePassword({
   required String password,
   required String newPassword,
  }) async {
    emit(const UpdatePasswordLoadingState());
    final Either<Failure, UpdatePasswordResponse> eitherResult = await updatePasswordUseCase(UpdatePasswordParams(
      password: password,
      newPassword: newPassword,
    ));
    eitherResult.fold((Failure failure) {
      emit(UpdatePasswordErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (UpdatePasswordResponse response) {
      emit(const UpdatePasswordSuccessState());
    });
  }
}


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/edit_address_usecase.dart';
import '../../../domain/entities/edit_address_response.dart';

part 'edit_address_states.dart';

class EditAddressCubit extends Cubit<EditAddressState> {
  final EditAddressUseCase editAddressUseCase;

  EditAddressCubit(this.editAddressUseCase) : super(const EditAddressInitialState());


  Future<void> fEditAddress({
   required int addressId,
   required String address,
   required String street,
   required String city,
   required String note,
  }) async {
    emit(const EditAddressLoadingState());
    final Either<Failure, EditAddressResponse> eitherResult = await editAddressUseCase(EditAddressParams(
      addressId: addressId,
      address: address,
      street: street,
      city: city,
      note: note,
    ));
    eitherResult.fold((Failure failure) {
      emit(EditAddressErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (EditAddressResponse response) {
      emit(const EditAddressSuccessState());
    });
  }
}


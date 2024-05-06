import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/add_address_usecase.dart';
import '../../../domain/entities/add_address_response.dart';

part 'add_address_states.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  final AddAddressUseCase addAddressUseCase;

  AddAddressCubit(this.addAddressUseCase) : super(const AddAddressInitialState());


  Future<void> fAddAddress({
   required String address,
   required String street,
   required String city,
   required String note,
   required int defaultKey,
  }) async {
    emit(const AddAddressLoadingState());
    final Either<Failure, AddAddressResponse> eitherResult = await addAddressUseCase(AddAddressParams(
      address: address,
      street: street,
      city: city,
      note: note,
      defaultKey: defaultKey,
    ));
    eitherResult.fold((Failure failure) {
      emit(AddAddressErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (AddAddressResponse response) {
      emit(const AddAddressSuccessState());
    });
  }
}


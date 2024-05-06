import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/get_address_usecase.dart';
import '../../../domain/entities/get_address_response.dart';

part 'get_address_states.dart';

class GetAddressCubit extends Cubit<GetAddressState> {
  final GetAddressUseCase getAddressUseCase;

  GetAddressCubit(this.getAddressUseCase)
      : super(const GetAddressInitialState());

  Address? data;

  Future<void> fGetAddress({
    required String address,
    required String street,
    required String city,
    required String note,
  }) async {
    emit(const GetAddressLoadingState());
    final Either<Failure, GetAddressResponse> eitherResult =
        await getAddressUseCase(GetAddressParams(
      address: address,
      street: street,
      city: city,
      note: note,
    ));
    eitherResult.fold((Failure failure) {
      emit(GetAddressErrorState(
          message: failure.message ?? 'pleaseTryAgainLater'));
    }, (GetAddressResponse response) {
      data = response.data;
      emit(GetAddressSuccessState(value: response.data, message: 'success'));
    });
  }
}

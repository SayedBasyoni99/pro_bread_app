import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../domain/usecases/send_gift_usecase.dart';
import '../../../domain/entities/send_gift_response.dart';

part 'send_gift_states.dart';

class SendGiftCubit extends Cubit<SendGiftState> {
  final SendGiftUseCase sendGiftUseCase;

  SendGiftCubit(this.sendGiftUseCase) : super(const SendGiftInitialState());


  Future<void> fSendGift({
   required String name,
   required String phone,
   required String note,
   required String area,
   required String street,
   required String building,
   required String mark,
   required String day,
   required String time,
   required int orderId,
   required int lat,
   required int lang,
  }) async {
    emit(const SendGiftLoadingState());
    final Either<Failure, SendGiftResponse> eitherResult = await sendGiftUseCase(SendGiftParams(
      name: name,
      phone: phone,
      note: note,
      area: area,
      street: street,
      building: building,
      mark: mark,
      day: day,
      time: time,
      orderId: orderId,
      lat: lat,
      lang: lang,
    ));
    eitherResult.fold((Failure failure) {
      emit(SendGiftErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (SendGiftResponse response) {
      emit(const SendGiftSuccessState());
    });
  }
}


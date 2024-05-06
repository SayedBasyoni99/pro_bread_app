import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/get_delivery_hours_usecase.dart';
import '../../../domain/entities/get_delivery_hours_response.dart';

part 'get_delivery_hours_states.dart';

class GetDeliveryHoursCubit extends Cubit<GetDeliveryHoursState> {
  final GetDeliveryHoursUseCase getDeliveryHoursUseCase;

  GetDeliveryHoursCubit(this.getDeliveryHoursUseCase) : super(const GetDeliveryHoursInitialState());

  List<DeliveryHourData> data = <DeliveryHourData>[];

  Future<void> fGetDeliveryHours() async {
    emit(const GetDeliveryHoursLoadingState());
    final Either<Failure, GetDeliveryHoursResponse> eitherResult = await getDeliveryHoursUseCase(NoParams());
    eitherResult.fold((Failure failure) {
      emit(GetDeliveryHoursErrorState(message: failure.message?? 'pleaseTryAgainLater'));
    }, (GetDeliveryHoursResponse response) {
      data.clear();
      data.addAll(response.data);
      emit(GetDeliveryHoursSuccessState(value: response.data));
    });
  }
}


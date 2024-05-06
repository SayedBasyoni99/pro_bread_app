import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/send_gift_response.dart';
import '../repositories/common_repo.dart';


class SendGiftUseCase extends UseCase<SendGiftResponse, SendGiftParams> {
  final CommonRepository repository;

  SendGiftUseCase({required this.repository});

  @override
  Future<Either<Failure, SendGiftResponse>> call(SendGiftParams params) async {
    return await repository.sendGift(params: params);
  }
}


class SendGiftParams extends Equatable {
  final String? name;
  final String? phone;
  final String? note;
  final String? area;
  final String? street;
  final String? building;
  final String? mark;
  final String? day;
  final String? time;
  final int? orderId;
  final int? lat;
  final int? lang;

  const SendGiftParams({
    required this.name,
    required this.phone,
    required this.note,
    required this.area,
    required this.street,
    required this.building,
    required this.mark,
    required this.day,
    required this.time,
    required this.orderId,
    required this.lat,
    required this.lang,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'note': note,
    'area': area,
    'street': street,
    'building': building,
    'mark': mark,
    'day': day,
    'time': time,
    'order_id': orderId,
    'lat': lat,
    'lang': lang,
  };

  @override
  List<Object?> get props => <Object?>[
    name,
    phone,
    note,
    area,
    street,
    building,
    mark,
    day,
    time,
    orderId,
    lat,
    lang,
  ];

}




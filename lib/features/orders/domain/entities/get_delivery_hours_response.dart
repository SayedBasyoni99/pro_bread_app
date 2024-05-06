import 'package:equatable/equatable.dart';

class GetDeliveryHoursResponse extends Equatable{
  final int status;
  final List<DeliveryHourData> data;

  const GetDeliveryHoursResponse({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    data,
  ];
}


class DeliveryHourData extends Equatable {
  final int key;
  final String day;
  final String start;
  final String end;

  const DeliveryHourData({
    required this.key,
    required this.day,
    required this.start,
    required this.end,
  });

  DeliveryHourData copyWith({
    int? key,
    String? day,
    String? start,
    String? end,
  }) {
    return DeliveryHourData(
      key: key ?? this.key,
      day: day ?? this.day,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    key,
    day,
    start,
    end,
  ];

}



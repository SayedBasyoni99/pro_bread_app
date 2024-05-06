import '../../domain/entities/get_delivery_hours_response.dart';

class GetDeliveryHoursModel extends GetDeliveryHoursResponse {
  const GetDeliveryHoursModel({
    required super.status,
    required super.data,
  });

  factory GetDeliveryHoursModel.fromJson(Map<String, dynamic> json) =>
      GetDeliveryHoursModel(
        status: json['status'],
        data: (json['data'] as List<dynamic>)
            .map((dynamic e) => DeliveryHourDataModel.fromJson(e))
            .toList(),
      );
}


class DeliveryHourDataModel extends DeliveryHourData {
  const DeliveryHourDataModel({
    required super.key,
    required super.day,
    required super.start,
    required super.end,
  });

  factory DeliveryHourDataModel.fromJson(Map<String, dynamic> json) => DeliveryHourDataModel(
    key: json['key'] != null? num.tryParse(json['key'].toString())?.toInt()?? 0: 0,
    day: json['day'] ?? '',
    start: json['start'] ?? '',
    end: json['end'] ?? '',
  );

}




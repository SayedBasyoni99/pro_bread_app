import '../../domain/entities/send_gift_response.dart';

class SendGiftModel extends SendGiftResponse {
  const SendGiftModel({
    required super.message,
    required super.status,
  });

  factory SendGiftModel.fromJson(Map<String, dynamic> json) => SendGiftModel(
        message: json['message'],
        status: json['status'],
      );
}

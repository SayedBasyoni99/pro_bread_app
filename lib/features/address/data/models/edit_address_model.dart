import '../../domain/entities/edit_address_response.dart';

class EditAddressModel extends EditAddressResponse {
  const EditAddressModel({
    required super.message,
    required super.status,
  });

  factory EditAddressModel.fromJson(Map<String, dynamic> json) =>
      EditAddressModel(
        message: json['message'],
        status: json['status'],
      );
}

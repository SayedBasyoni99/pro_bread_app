import '../../domain/entities/add_address_response.dart';

class AddAddressModel extends AddAddressResponse {
  const AddAddressModel({
    required super.message,
    required super.status,
  });

  factory AddAddressModel.fromJson(Map<String, dynamic> json) =>
      AddAddressModel(
        message: json['message'],
        status: json['status'],
      );
}




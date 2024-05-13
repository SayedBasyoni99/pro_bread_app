import '../../domain/entities/get_address_response.dart';

class GetAddressModel extends GetAddressResponse {
  const GetAddressModel({
    required super.status,
    required super.data,
  });

  factory GetAddressModel.fromJson(Map<String, dynamic> json) =>
      GetAddressModel(
        status: json['status'],
        data: AddressModel.fromJson(json['data']),
      );
}

class AddressModel extends Address {
  const AddressModel({
    required super.id,
    required super.address,
    required super.street,
    required super.city,
    required super.note,
    required super.defaultKey,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] != null
          ? num.tryParse(json['id'].toString())?.toInt() ?? 0
          : 0,
      address: json['address'] ?? '',
      street: json['street'] ?? '',
      city: json['city'] ?? '',
      note: json['note'] ?? '',
      defaultKey: json['default'] != null
          ? num.tryParse(json['default'].toString())?.toInt() ?? 0
          : 0,
    );
  }
}

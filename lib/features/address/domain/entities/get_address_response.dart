import 'package:equatable/equatable.dart';

class GetAddressResponse extends Equatable{
  final int status;
  final Address data;

  const GetAddressResponse({
    required this.status,
    required this.data,
  });

  @override
  List<Object?> get props => <Object?>[
    status,
    data,
  ];
}


class Address extends Equatable {
  final int id;
  final String address;
  final String street;
  final String city;
  final String note;
  final int defaultKey;

  const Address({
    required this.id,
    required this.address,
    required this.street,
    required this.city,
    required this.note,
    required this.defaultKey,
  });

  Address copyWith({
    int? id,
    String? address,
    String? street,
    String? city,
    String? note,
    int? defaultKey,
  }) {
    return Address(
      id: id ?? this.id,
      address: address ?? this.address,
      street: street ?? this.street,
      city: city ?? this.city,
      note: note ?? this.note,
      defaultKey: defaultKey ?? this.defaultKey,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    id,
    address,
    street,
    city,
    note,
    defaultKey,
  ];

}



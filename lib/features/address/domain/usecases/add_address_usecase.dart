import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/add_address_response.dart';
import '../repositories/address_repo.dart';


class AddAddressUseCase extends UseCase<AddAddressResponse, AddAddressParams> {
  final AddressRepository repository;

  AddAddressUseCase({required this.repository});

  @override
  Future<Either<Failure, AddAddressResponse>> call(AddAddressParams params) async {
    return await repository.addAddress(params: params);
  }
}


class AddAddressParams extends Equatable {
  final String? address;
  final String? street;
  final String? city;
  final String? note;
  final int? defaultKey;

  const AddAddressParams({
    required this.address,
    required this.street,
    required this.city,
    required this.note,
    required this.defaultKey,
  });

  Map<String, dynamic> toJson() => {
    'address': address,
    'street': street,
    'city': city,
    'note': note,
    'default': defaultKey,
  };

  @override
  List<Object?> get props => <Object?>[
    address,
    street,
    city,
    note,
    defaultKey,
  ];

}




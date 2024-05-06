import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/edit_address_response.dart';
import '../repositories/address_repo.dart';


class EditAddressUseCase extends UseCase<EditAddressResponse, EditAddressParams> {
  final AddressRepository repository;

  EditAddressUseCase({required this.repository});

  @override
  Future<Either<Failure, EditAddressResponse>> call(EditAddressParams params) async {
    return await repository.editAddress(params: params);
  }
}


class EditAddressParams extends Equatable {
  final int? addressId;
  final String? address;
  final String? street;
  final String? city;
  final String? note;

  const EditAddressParams({
    required this.addressId,
    required this.address,
    required this.street,
    required this.city,
    required this.note,
  });

  Map<String, dynamic> toJson() => {
    'address_id': addressId,
    'address': address,
    'street': street,
    'city': city,
    'note': note,
  };

  @override
  List<Object?> get props => <Object?>[
    addressId,
    address,
    street,
    city,
    note,
  ];

}




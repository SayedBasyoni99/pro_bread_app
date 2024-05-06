import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/get_address_response.dart';
import '../repositories/address_repo.dart';


class GetAddressUseCase extends UseCase<GetAddressResponse, GetAddressParams> {
  final AddressRepository repository;

  GetAddressUseCase({required this.repository});

  @override
  Future<Either<Failure, GetAddressResponse>> call(GetAddressParams params) async {
    return await repository.getAddress(params: params);
  }
}


class GetAddressParams extends Equatable {
  final String? address;
  final String? street;
  final String? city;
  final String? note;

  const GetAddressParams({
    required this.address,
    required this.street,
    required this.city,
    required this.note,
  });

  Map<String, dynamic> toJson() => {
    'address': address,
    'street': street,
    'city': city,
    'note': note,
  };

  @override
  List<Object?> get props => <Object?>[
    address,
    street,
    city,
    note,
  ];

}




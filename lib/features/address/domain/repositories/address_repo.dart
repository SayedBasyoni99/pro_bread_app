import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/edit_address_response.dart';
import '../../domain/usecases/edit_address_usecase.dart';
import '../../domain/entities/get_address_response.dart';
import '../../domain/usecases/get_address_usecase.dart';
import '../../domain/entities/add_address_response.dart';
import '../../domain/usecases/add_address_usecase.dart';

abstract class AddressRepository {
  Future<Either<Failure, EditAddressResponse>> editAddress({
    required EditAddressParams params,
  });


  Future<Either<Failure, GetAddressResponse>> getAddress({
    required GetAddressParams params,
  });


  Future<Either<Failure, AddAddressResponse>> addAddress({
    required AddAddressParams params,
  });


}

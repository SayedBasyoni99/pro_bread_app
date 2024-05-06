import 'package:dartz/dartz.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../../core/utils/log_utils.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasources/address_remote_datasource.dart';
import '../../domain/repositories/address_repo.dart';
import '../../domain/entities/edit_address_response.dart';
import '../../domain/usecases/edit_address_usecase.dart';
import '../../domain/entities/get_address_response.dart';
import '../../domain/usecases/get_address_usecase.dart';
import '../../domain/entities/add_address_response.dart';
import '../../domain/usecases/add_address_usecase.dart';


class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource remote;

  AddressRepositoryImpl({
    required this.remote,
  });

  /// Impl
  @override
  Future<Either<Failure, EditAddressResponse>> editAddress({required EditAddressParams params}) async {
    try {
      
      final EditAddressResponse response = await remote.editAddress(params: params);
        return Right<Failure, EditAddressResponse>(response);
      } on AppException catch (error) {
        Log.e('[editAddress] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, EditAddressResponse>(error.toFailure());
      }
  }


  @override
  Future<Either<Failure, GetAddressResponse>> getAddress({required GetAddressParams params}) async {
    try {
      final GetAddressResponse response = await remote.getAddress(params: params);
        return Right(response);
      } on AppException catch (error) {
        Log.e('[getAddress] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
  }


  @override
  Future<Either<Failure, AddAddressResponse>> addAddress({required AddAddressParams params}) async {
    try {
      final AddAddressResponse response = await remote.addAddress(params: params);
        return Right<Failure, AddAddressResponse>(response);
      } on AppException catch (error) {
        Log.e('[addAddress] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left<Failure, AddAddressResponse>(error.toFailure());
      }
  }


}

